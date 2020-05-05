from django.urls import path, include
from .views      import HomeView

urlpatterns = [
    path('products', include('products.urls')),
    path('',         HomeView.as_view()),
    path('order',    include('order.urls')),
    path('account',  include('account.urls'))
]
