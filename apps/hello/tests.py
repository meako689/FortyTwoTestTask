from django.test import TestCase

# Create your tests here.


class SomeTests(TestCase):
    def test_math(self):
        """
        put docstrings in your tests
        """
        self.assertEqual(2 + 2, 5)
