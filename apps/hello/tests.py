from django.test import TestCase
from django.test.client import Client

class TicketOne(TestCase):
    def response_test(self):
    	c = Client()
        response = c.get('/')
        assert(response.status_code == '200')