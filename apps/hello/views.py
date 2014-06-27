from django.shortcuts import render
from hello.models import Info
from django.shortcuts import render_to_response
from django.contrib import messages


# Create your views here.
def show_info(request, id=1):
    allinfo = Info.objects.all()
    db = Info._meta.fields
    print db
    return render_to_response('info.html',{'allinfo': allinfo})

def show_info_a(request, id=1):

    show_list=[ 'info_firstname',
                'info_lastname',
                'info_bio',
                'info_email',
                'info_birth',
                'info_jabber',
                'info_other',
                'info_skype']
    args = {}
    for elem in show_list:
        args[elem] = Info.objects.get(id = pk)
    print(args)
    return render_to_response('info.html',args)

def get_messages(request):
    infos = Info.objects.all()
    render_to_response('messages.html',{'message': infos} )