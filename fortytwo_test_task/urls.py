from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    url(r'^$', 'hello.views.home', name='home'),
    url(r'^requests/', 'hello.views.requests'),

    url(r'^admin/', include(admin.site.urls)),

)
