from django.urls import path

from main import views

app_name = 'main'
urlpatterns = [
    path('index/', views.index, name="index"),
    path('details/', views.details, name="details"),
    path('information/', views.information, name="information"),
    path('tags/', views.tags, name="tags"),
    path('tagmatch/', views.tag_match, name="tagmatch"),
    path('artmatch/', views.art_match, name="artmatch"),
    path('passages_sub/', views.passages_sub, name="community"),
    path('selfinformation/', views.self_information, name="self_information"),

]
