from rest_framework import serializers
from .models import Patient, Session, Notes, Query, History

class PatientSerializer(serializers.ModelSerializer):
    class Meta:
        model = Patient
        fields = ['patientID', 'firstName', 'lastName', 'email', 'mobileNum', 'age', 'gender']

class SessionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Session
        fields = ['sessionID', 'date', 'time', 'noteID', 'patient']

class NotesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notes
        fields = ['noteID', 'text', 'audioRecording', 'transcription']

class QuerySerializer(serializers.ModelSerializer):
    class Meta:
        model = Query
        fields = ['queryID', 'userID', 'queryText', 'queryDate']

class HistorySerializer(serializers.ModelSerializer):
    class Meta:
        model = History
        fields = ['historyID', 'userID', 'actionType', 'actionDate', 'actionDetails']
