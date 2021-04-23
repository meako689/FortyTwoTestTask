from rest_framework.test import APITestCase
from django.shortcuts import reverse


class HelloAPITest(APITestCase):
    def test_ping(self):
        """
        endpoint is accessible and always return same status
        """
        response = self.client.get(reverse("api_hello:ping"))
        self.assertTrue(response.json()["status"])
