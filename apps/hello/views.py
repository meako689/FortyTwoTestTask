from django.shortcuts import render
from hello.models import Request
# Create your views here.

def home(request):
	return render(request, 'index.html')

def requests(request):
	requests = Request.objects.all()
	return render(request, 'requests.html', requests:requests)