from django.db import models

# Create your models here.

class Request:
	method = models.CharField(max_length=10)
	path = models.TextField()
	user = models.TextField()
	created_at = models.DateTimeField(auto_now_add=True)
	updated_at = models.DateTimeField(auto_now=True)

	def __unicode__(self):
		return self.path 