# Generated by Django 3.2 on 2022-03-27 16:00

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('mail', '0011_auto_20220327_1050'),
    ]

    operations = [
        migrations.AlterField(
            model_name='label',
            name='slug',
            field=models.SlugField(max_length=100, null=True),
        ),
    ]
