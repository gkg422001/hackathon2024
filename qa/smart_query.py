import pandas as pd
import time
import torch
from datasets import load_dataset
from pinecone import Pinecone, PodSpec
from sentence_transformers import SentenceTransformer
from tqdm.auto import tqdm
from transformers import pipeline
from pprint import pprint

# load the dataset into a pandas dataframe
df = load_dataset("Amod/mental_health_counseling_conversations", split="train").to_pandas()

# select only context and response column
df = df[["Context", "Response"]]

# drop rows containing duplicate context passages
df = df.drop_duplicates(subset="Context")

# initialize Pinecone index
api_key = "20fb6c7d-03fd-4eb1-a1c9-2e54cc6b643d"
environment = "gcp-starter"

# connect to pinecone environment
pc = Pinecone(
    api_key=api_key,
    environment=environment # find next to API key in console
)
spec = PodSpec(environment=environment)
index_name = 'echo'

if index_name in pc.list_indexes().names():
  pc.delete_index(index_name)

  # we create a new index
  pc.create_index(
      name=index_name,
      dimension=384, # dimensionality of text-embedding-ada-002
      metric='cosine',
      spec=spec
  )

  # wait for index to be ready before connecting
  while not pc.describe_index(index_name).status['ready']:
    time.sleep(1)

# connect to extractive-question-answering index we created
index = pc.Index(index_name)

# Intialize Retriever
# set device to GPU if available
device = 'cuda' if torch.cuda.is_available() else 'cpu'

# load the retriever model from huggingface model hub
retriever = SentenceTransformer('multi-qa-MiniLM-L6-cos-v1', device=device)

# Generate Embeddings and Upsert
batch_size = 4

for i in tqdm(range(0, len(df), batch_size)):
    # find end of batch
    i_end = min(i+batch_size, len(df))
    # extract batch
    batch = df.iloc[i:i_end]
    # generate embeddings for batch
    emb = retriever.encode(batch['Context'].tolist()).tolist()
    # get metadata
    meta = batch.to_dict(orient='records')
    # create unique IDs
    ids = [f"{idx}" for idx in range(i, i_end)]
    # add all to upsert list
    to_upsert = list(zip(ids, emb, meta))
    # upsert/insert these records to pinecone
    _ = index.upsert(vectors=to_upsert)

# check that we have all vectors in index
index.describe_index_stats()

# Initialize Reader
model_name = 'deepset/electra-base-squad2'

# load the reader model into a question-answering pipeline
reader = pipeline(tokenizer=model_name, model=model_name, task='question-answering', device = device)

# gets context passages from the pinecone index
def get_context(question, top_k):
    # generate embeddings for the question
    xq = retriever.encode([question]).tolist()
    # search pinecone index for context passage with the answer
    xc = index.query(vector=xq, top_k=top_k, include_metadata=True)
    # extract the context passage from pinecone search result
    c = [x["metadata"]['Context'] for x in xc["matches"]]
    return c

# extracts answer from the context passage
def extract_answer(question, context):
    results = []
    for c in context:
        # feed the reader the question and contexts to extract answers
        answer = reader(question=question, context=c)
        # add the context to answer dict for printing both together
        answer["Context"] = c
        results.append(answer)
    # sort the result based on the score from reader model
    sorted_result = pprint(sorted(results, key=lambda x: x['score'], reverse=True))
    return sorted_result

question = "Patients who had anxiety"
context = get_context(question, top_k=3)
extract_answer(question, context)