from django.conf.urls import patterns, include, url
from apps.hello.views import show_info_all, get_messages,show_info

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'firstapp.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),



    url(r'^messages/', get_messages),
    url(r'^info_all/', show_info_all),
    url(r'^info/(?P<id>\d+)/$', show_info),





)