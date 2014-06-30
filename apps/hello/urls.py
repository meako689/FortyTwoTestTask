from django.conf.urls import patterns, include, url

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'firstapp.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),



    url(r'^messages/', 'hello.views.get_messages'),
    url(r'^info/', 'hello.views.show_info'),






)