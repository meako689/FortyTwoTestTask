from django.shortcuts import render
from hello.models import Request
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
# Create your views here.

def home(request):
	return render(request, 'index.html')

def requests(request):
	requests = Request.objects.all()
	paginator = Paginator(requests, 25) # Show 25 contacts per page
	page = request.GET.get('page')
	try:
		contacts = paginator.page(page)
	except PageNotAnInteger:
		# If page is not an integer, deliver first page.
		contacts = paginator.page(1)
	except EmptyPage:
	# If page is out of range (e.g. 9999), deliver last page of results.
	contacts = paginator.page(paginator.num_pages)

return render(request, 'requests.html', locals())