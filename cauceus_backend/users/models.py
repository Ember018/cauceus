from django.db import models
from django.contrib.auth.models import AbstractUser

class User(AbstractUser):
    country = models.CharField(max_length=100)
    city = models.CharField(max_length=100)
    postal_code = models.CharField(max_length=100,null=True,blank=True)
    phone_number = models.CharField(max_length=30,null=True,blank=True) # Optional for privacy concern
    preferred_contact_method = models.CharField(max_length=30)

    def __str__(self):
        return self.email
