import json
import jwt
import re
import bcrypt
import requests

from django.test                import TestCase , Client
from .models                    import User, Address , User_address

from django.views               import View
from django.http                import HttpResponse, JsonResponse
from django.core.validators     import validate_email
from django.core.exceptions     import ValidationError

from foodly_project.my_settings import SECRET_KEY,   ALGORITHM
from .utils                     import login_check

class SignUp(TestCase):
    def setUp(self):
        User.objects.create(
            email = "jakdu@gmail.com",
            password = "jakdu123123"
        )

    def tearDown(self):
        client = Client()

        user = {
            "email" : "jakdu123@gmail.com",
            "password" : "jakdu123123"
        }

        response = client.post("/account/signup" , json.dumps(user) , content_type = "application/json")
        self.assertEqual(response.status_code , 200)

    def test_sign_exists_email(self):
        client = Client()

        user = {
            "email" : "jakdu@gmail.com",
            "password " : "jakdu"
        }

        response = client.post("/account/signup" , json.dumps(user) , content_type = "application/json")
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json(), {"message" : "EXISTS_EMAIL"})

