from django.test import TestCase
from apps.hello.models import Info
from apps.selenium import webdriver
from apps.hello.views import show_info
from django.http import HttpRequest
import unittest

class DataOutTest(unittest.TestCase):

    def setUp(self):
        self.browser = webdriver.Firefox()

    def tearDown(self):
        self.browser.quit()

    def testTitle(self):
        self.browser.get('http://localhost:8000/task/info/')
        self.assertIn('InfoPage', self.browser.title)

class ViewTest(TestCase):

    def test_root_url_resolves_to_home_page_view(self):
        found = resolve('/')
        self.assertEqual(found.func, show_info)


    def test_home_page_returns_correct_html(self):
        request = HttpRequest()  #1
        response = show_info(request)  #2
        self.assertTrue(response.content.startswith(b'<html>'))  #3
        self.assertIn(b'<title>InfoPage</title>', response.content)  #4
        self.assertTrue(response.content.endswith(b'</html>'))  #5



class DataTest(TestCase):
    def setUp(self):

        Info.objects.create(info_firstname ="Buddy",
                            info_lastname ="Budd",
                            info_bio = "Hi there",
                            info_email ="mail@mail.com",
                            info_birth = "1967-05-06",
                            info_jabber = "dont have",
                            info_other = "nothing",
                            info_skype= "nothing")
    def test_1(self):
        ''' will error on assertion'''
        Buddy = Info.objects.get(info_firstname="Buddy")
        self.assertEqual(Buddy.info_firstname, "Budd")


if __name__ == '__main__':  #7
    unittest.main(warnings='ignore')