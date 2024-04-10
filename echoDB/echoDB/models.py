from django.db import models
from django.contrib.auth.models import User

class Patient(models.Model):
    patientID = models.AutoField(primary_key=True)
    firstName = models.CharField(max_length=128)
    lastName = models.CharField(max_length=128)
    email = models.CharField(max_length=128)
    age = models.IntegerField() # Age as an integer
    mobileNum = models.CharField(max_length=20) # Mobile number as a string
    gender = models.CharField(max_length=1, choices=[('M', 'Male'), ('F', 'Female')]) # Gender as a character with choices
       
class Session(models.Model):
    sessionID = models.AutoField(primary_key=True)
    date = models.DateField()
    time = models.TimeField()
    noteID = models.OneToOneField('Notes', on_delete=models.CASCADE, related_name='session')
    patient = models.ForeignKey('Patient', on_delete=models.CASCADE, related_name='sessions')

class Notes(models.Model):
    noteID = models.AutoField(primary_key=True)
    text = models.TextField()
    audioRecording = models.FileField(upload_to='audio_recordings/')
    transcription = models.TextField()

class Query(models.Model):
    queryID = models.AutoField(primary_key=True)
    userID = models.ForeignKey(User, on_delete=models.CASCADE, related_name='queries')
    queryText = models.TextField()
    queryDate = models.DateTimeField(auto_now_add=True)

class History(models.Model):
    historyID = models.AutoField(primary_key=True)
    userID = models.ForeignKey(User, on_delete=models.CASCADE, related_name='history')
    actionType = models.CharField(max_length=128)
    actionDate = models.DateTimeField(auto_now_add=True)
    actionDetails = models.TextField()
