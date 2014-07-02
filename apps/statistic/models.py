from django.db import models

# Create your models here.
class WebRequest(models.Model):
    class Meta():
        db_table = "log"

    log = models.CharField(max_length=1000)
    statistic_webrequest = models.CharField(max_length=2000)

