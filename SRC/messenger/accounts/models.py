from django.db import models
from django.contrib.auth.models import AbstractUser
from accounts.manager import UserManager
from .validators import validate_length_phone_no, validate_phone_no


class User(AbstractUser):
    email = models.EmailField(null=True, blank=True, verbose_name='Email Recovery')
    phone_number = models.CharField(max_length=11, null=True, blank=True,
                                    validators=[validate_length_phone_no, validate_phone_no])
    birth_date = models.DateField(null=True, blank=True)

    status_choices_gender = [
        ('F', 'female'),
        ('M', 'male'),
        ('C', 'Custom'),
        ('R', 'Rather not say')
    ]

    gender = models.CharField(max_length=1, choices=status_choices_gender, null=True, blank=True)
    status_choices_country = [
        ('IR', 'Iran'),
        ('FR', 'France'),
        ('UK', 'United Kingdom'),
        ('US', 'United States'),
    ]

    country = models.CharField(max_length=2, choices=status_choices_country, null=True, blank=True)
    slug = models.SlugField(max_length=100, unique=True, null=True)

    objects = UserManager()

    def __str__(self):
        return f'{self.username} {self.first_name}'
