# Generated by Django 2.2.26 on 2022-02-08 23:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('rango', '0002_auto_20220206_2008'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='slug',
            field=models.SlugField(default=' '),
            preserve_default=False,
        ),
    ]
