from django.test import TestCase
from apps.hello.models import Info
from selenium import webdriver
import unittest

class DataOutTest(unittest.TestCase):

    def setUp(self):
        self.browser = webdriver.Firefox()

    def tearDown(self):
        self.browser.quit()

    def test_can_start_a_list_and_retrieve_it_later(self):
        self.browser.get('http://localhost:8000/task/info/')
        self.assertIn('InfoPage', self.browser.title)
        self.fail('Finish the test!')




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