from django.contrib import admin
from hello.models import Request
from django.db import models
# Register your models here.

class RequestAdmin(admin.ModelAdmin):
	list_display = ['method', 'path', 'user', 'created_at', 'updated_at']

admin.site.register(Request, RequestAdmin)