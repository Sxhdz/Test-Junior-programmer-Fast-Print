"""fastprint URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include #mengimport modul include untuk mengambil url patterns dari direktori lain
from fastprint_app import urls as dashboard #mengimport url patterns dari direktori app dan mengannti nama nya dengan alias 'dashboard'

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include(dashboard)), #url '' (kosong) yang berfungsi ketika program di run maka ia adalah path url pertama yang akan dieksekusi
]
