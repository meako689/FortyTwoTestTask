from django.db import connection
from hello.models import Request
from time import time
from operator import add
from django.http import HttpRequest
import re


class ResponseMiddleWare(object):

    def process_view(self, request, view_func, view_args, view_kwargs):
    	# print request
    	response = view_func(request, *view_args, **view_kwargs)
    	data = {}
    	data['path'] = request.path_info
    	data['method'] =  request.META['REQUEST_METHOD']
    	data['user'] = request.META['HTTP_USER_AGENT']	
    	Request.objects.create(
    			method = data['method'],
    			path = data['path'],
    			user = data['user']
    		)
        return response