from django.db import models

# Create your models here.
class Info(models.Model):
    class Meta:
        db_table = "info"

    info_firstname = models.CharField(max_length=20, verbose_name='First Name')
    info_lastname = models.CharField(max_length=20,verbose_name='Last Name')
    info_bio = models.TextField(verbose_name='Bio')
    info_email = models.EmailField(verbose_name='e-mail')
    info_birth = models.DateField(blank = True, null = True)
    info_jabber = models.CharField(max_length=30,verbose_name='Jabber')
    info_other = models.TextField(verbose_name='Other Info')
    info_skype = models.CharField(max_length=15,verbose_name='Skype')




def dumps(value):
    return json.dumps(value,default=lambda o:None)