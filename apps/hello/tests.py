from django.test import TestCase
from django.test.client import Client

class SomeTests(TestCase):
    def response_test(self):
    	c = Client()
        response = c.get('/')
        assert(response.status_code == '200')