from django.urls  import path
from .views       import SignUpView , SignInView , KakaoSignInView , AddressView

urlpatterns = [
    path('/signup',                   SignUpView.as_view()),
    path('/signin',                   SignInView.as_view()),
    path('/kakao_signin',             KakaoSignInView.as_view()),
    path('/address/<int:address_id>', AddressView.as_view()),
]
