from django.db import models

# Create your models here.
class Info(models.Model):
    class Meta:
        db_table = "info"

    info_firstname = models.CharField(max_length=20)
    info_lastname = models.CharField(max_length=20)
    info_bio = models.TextField()
    info_email = models.EmailField()
    info_birth = models.DateField(blank = True, null = True)
    info_jabber = models.CharField(max_length=30) # Is it better to use models.EmailField() ???
    info_other = models.TextField()
    info_skype = models.CharField(max_length=15)

