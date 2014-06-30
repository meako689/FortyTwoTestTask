from django.contrib import admin
from apps.hello.models import Info
from statistic.models import WebRequest
# Register your models here.

class InfoAdm(admin.StackedInline):
    model = Info
    extra = 2

class AdminInfo(admin.ModelAdmin):
    pass

admin.site.register(Info, AdminInfo)


