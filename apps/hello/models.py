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

class WebRequest(models.Model):
    time = models.DateTimeField(auto_now_add=True)
    host = models.CharField(max_length=1000)
    path = models.CharField(max_length=1000)
    method = models.CharField(max_length=50)
    uri = models.CharField(max_length=2000)
    status_code = models.IntegerField()
    user_agent = models.CharField(max_length=1000,blank=True,null=True)
    remote_addr = models.IPAddressField()
    remote_addr_fwd = models.IPAddressField(blank=True,null=True)
    meta = models.TextField()
    cookies = models.TextField(blank=True,null=True)
    get = models.TextField(blank=True,null=True)
    post = models.TextField(blank=True,null=True)


def dumps(value):
    return json.dumps(value,default=lambda o:None)