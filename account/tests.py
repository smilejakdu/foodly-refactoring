import json
import jwt
import re
import bcrypt
import requests

from django.test                import TestCase , Client
from unittest.mock              import patch , MagicMock
from django.http                import HttpResponse, JsonResponse

from .utils                     import login_check
from .models                    import User , User_address , Address

from django.core.validators     import validate_email
from django.core.exceptions     import ValidationError

from foodly_project.my_settings import SECRET_KEY, ALGORITHM

class SignUp(TestCase):
    def setUp(self):
        User.objects.create(
            email      = "jakdu123@gmail.com",
            first_name = "jakdu",
            last_name  = "jakdu",
            password   = "jakdu123123"
        )

    def test_signup_success(self):
        client = Client()

        user = {
            "email"      : "jakdu@gmail.com",
            "password"   : "jakdu123123",
            "first_name" : "jakdu",
            "last_name"  : "jakdu"
        }

        response = client.post("/account/signup",
                               json.dumps(user),
                               content_type = "application/json")

        self.assertEqual(response.status_code, 200)

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
        self.assertEqual(response.json(), {"access" : token})

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
        self.assertEqual(response.json() , {"message" : "INVALID_KEYS"})

class KakaoSigninTest(TestCase):
    def setUp(self):
        User.objects.create(
            email    = "jakdu123@email.com",
            kakao_id = "3767"
        )

    @patch('account.views.requests') # account 앱의 views.py 에서 사용될 requests를 patch
    def test_kakao_signin(self , mocked_requests):
        client = Client()
        # 실제로 kakao API 를 호출하지 않고
        # kakao API 의 응답을 Fake 하기 위해 MockedResponse 작성

        class MockedResponse:
            def json(self):
                return {
                   'id'            : '3767',
                   'kakao_account' : {'email': 'jakdu_sory@gmail.com'}
                }

        mocked_requests.get = MagicMock(return_value = MockedResponse())

        header   = {'HTTP_Authorization' : 'header1234'}
        response = client.get('/account/kakao_signin'
                               , content_type='application/json'
                               , **header)

        self.assertEqual(response.status_code , 200)
