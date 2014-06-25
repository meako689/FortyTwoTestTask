from django.test import TestCase
from apps.hello.models import Info

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