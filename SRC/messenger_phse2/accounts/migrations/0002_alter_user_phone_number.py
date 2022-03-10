# Generated by Django 3.2 on 2022-03-07 23:18

import accounts.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='phone_number',
            field=models.CharField(blank=True, max_length=11, null=True, validators=[accounts.validators.validate_length_phone_no, accounts.validators.validate_phone_no]),
        ),
    ]
