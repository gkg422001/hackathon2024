from django.db import models

class Patient(models.Model):
    firstName = models.CharField(max_length=128)
    lastName = models.CharField(max_length=128)
    email = models.CharField(max_length=128)
    