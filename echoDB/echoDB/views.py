from rest_framework import viewsets
from .models import Patient, Session, Notes, Query, History
from .serializers import PatientSerializer, SessionSerializer, NotesSerializer, QuerySerializer, HistorySerializer

from rest_framework import viewsets
from .models import Patient, Session, Notes, Query, History
from .serializers import PatientSerializer, SessionSerializer, NotesSerializer, QuerySerializer, HistorySerializer

class PatientViewSet(viewsets.ModelViewSet):
    queryset = Patient.objects.all()
    serializer_class = PatientSerializer

class SessionViewSet(viewsets.ModelViewSet):
    queryset = Session.objects.all()
    serializer_class = SessionSerializer

class NotesViewSet(viewsets.ModelViewSet):
    queryset = Notes.objects.all()
    serializer_class = NotesSerializer

class QueryViewSet(viewsets.ModelViewSet):
    queryset = Query.objects.all()
    serializer_class = QuerySerializer

class HistoryViewSet(viewsets.ModelViewSet):
    queryset = History.objects.all()
    serializer_class = HistorySerializer
