from django.contrib import admin

from apps.statistic.models import WebRequest


# Register your models here.

class StatisticAdm(admin.StackedInline):
    model = WebRequest
    extra = 2

class AdminInfo(admin.ModelAdmin):
    pass

admin.site.register(WebRequest, AdminInfo)