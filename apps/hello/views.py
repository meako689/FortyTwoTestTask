from django.shortcuts import render
from hello.models import Info
from django.shortcuts import render_to_response


# Create your views here.
def show_info(request, id=1):
    allinfo = Info.objects.all()
    return render_to_response('info.html',{'allinfo': allinfo})
