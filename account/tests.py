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
            email      = "jakdu@gmail.com",
            password   = "jakdu123123",
            first_name = "jakdu",
            last_name  = "jakdu"
        )

    def tearDown(self):
        client = Client()

        user = {
            "email"    : "jakdu123@gmail.com",
            "password" : "jakdu123123"
        }

        response = client.post("/account/signup" , json.dumps(user) , content_type = "application/json")
        self.assertEqual(response.status_code , 200)

    def test_signup_exists_email(self):
        client = Client()

        user = {
            "email"      : "jakdu@gmail.com",
            "password "  : "jakdu",
            "first_name" : "jakdu",
            "last_name"  : "jakdu"
        }

        response = client.post("/account/signup" , json.dumps(user) , content_type = "application/json")
        self.assertEqual(response.status_code, 400)
        self.assertEqual(response.json(), {"message" : "EXISTS_EMAIL"})

    def test_signup_invalid_email(self):
        client = Client()

        user = {
            "email"      : "jakdu357gmail.com",
            "password"   : "1231dfacvasdf1",
            "first_name" : "jakdu",
            "last_name"  : "jakdu",
        }

        response = client.post("/account/signup" , json.dumps(user) , content_type = "application/json")
        self.assertEqual(response.status_code , 400)
        self.assertEqual(response.json() , {"message" : "INVALID_EMAIL"})

    def test_signup_empty_first_name(self):
        client = Client()

        user = {
            "email"      : "jakdu157@gmail.com",
            "password"   : "123124dfasf" ,
            "first_name" : "",
            "last_name"  : "jakdu"
        }

        response = client.post("/account/signup" ,
                               json.dumps(user) ,
                               content_type="application/json")

        self.assertEqual(response.status_code , 400)
        self.assertEqual(response.json() , {"message" :"EMPTY_FIRSTNAME"})

    def test_signup_empty_last_name(self):
        client = Client()

        user = {
            "email"      : "sory1@gmail.com",
            "password"   : "123123123ddsd",
            "first_name" : "jakdu",
            "last_name"  : ""
        }

        response = client.post("/account/signup" ,
                               json.dumps(user) ,
                               content_type="application/json")

        self.assertEqual(response.status_code , 400)
        self.assertEqual(response.json() , {"message" : "EMPTY_LASTNAME"})


class SignIn(TestCase):
    def setUp(self):
        password = bcrypt.hashpw("sory123123".encode("UTF-8") , bcrypt.gensalt()).decode("UTF-8")

        User.objects.create(
            email      = "sory@gmail.com",
            password   = password,
            first_name = "jakdu",
            last_name  = "jakdu"
        )

    def tearDown(self):
        User.objects.all().delete()

    def test_signin_success(self):
        user = {
            "email"    : "sory@gmail.com",
            "password" : "sory123123",
        }

        client = Client()

        response = client.post("/account/signin" ,
                               json.dumps(user) ,
                               content_type="application/json")

        token = jwt.encode({"email" : user["email"]} ,
                           SECRET_KEY["secret"] ,
                           algorithm=ALGORITHM).decode("UTF-8")

        self.assertEqual(response.status_code , 200)
        self.assertEqual(response.json() , {"access_token" : token})

    def test_signin_doesnot_exist_email(self):
        user  ={
            "email"    : "sory_jakdu@gmail.com",
            "password" : "jakdujakdu123"
        }

        client = Client()

        response = client.post("/account/signin" ,
                               json.dumps(user) ,
                               content_type="application/json")

        self.assertEqual(response.status_code , 400)
        self.assertEqual(response.json() , {"message" : "NOTFOUND_EMAIL"})

    def test_signin_invalid_key(self):

        user = {
            "nick_name" : "smile_jakdu" ,
            "password " : "123123"
        }

        client = Client()

        response = client.post("/account/signin" ,
                               json.dumps(user) ,
                               content_type="application/json")

        self.assertEqual(response.status_code , 400)
        self.assertEqual(response.json() , {"message" : "INVALID_KEY"})
