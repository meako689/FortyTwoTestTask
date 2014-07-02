from django.conf.urls import patterns, include, url
from apps.hello.views import show_info, get_messages

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'firstapp.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),



    url(r'^messages/', get_messages),
    url(r'^info/', show_info),






)