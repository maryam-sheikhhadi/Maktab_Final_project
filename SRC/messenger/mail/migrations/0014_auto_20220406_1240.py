# Generated by Django 3.2 on 2022-04-06 08:10

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('mail', '0013_alter_email_text'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='email',
            name='is_archive',
        ),
        migrations.RemoveField(
            model_name='email',
            name='is_draft',
        ),
        migrations.RemoveField(
            model_name='email',
            name='is_trash',
        ),
    ]
