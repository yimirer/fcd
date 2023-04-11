from django.urls import path

from author import views
app_name = 'author'
urlpatterns = [
    path('login/', views.author_register_login, name='author_register_login'),
    path('registersuccess/', views.register_success, name='register_success'),
    path('registerfail/', views.register_fail, name='register_fail'),
]