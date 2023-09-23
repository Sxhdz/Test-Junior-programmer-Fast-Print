from django.urls import path, include #mengimport library django.urls untuk pattern url di app
from . import views #menginisiasi file views.py

app_name = 'app' #membuat app name untuk urls app agar lebih mudah dikenali
urlpatterns=[
    path('get_api/', views.get_api, name='get_api'), #patterns 'get_api' yang akan mengembalikan data dari api berupa json
    path('create_kategori/', views.kategoriAPI, name='add_kategori'), # path url untuk menambahkan data kategori
    path('create_status/', views.statusAPI, name='add_status'), # path url untuk menambahkan data kategori
    
    path('', views.produk, name='admin_produk'),
    path('tambah-produk/', views.tambah, name='tambah_produk'),
    path('ubah-produk/<str:id>/', views.ubah, name='ubah_produk'), # Path url untuk merubah data dengan parameter id
    path('hapus-produk/<str:id>/', views.delete, name='hapus_produk'), # Path url untuk menghapus data dengan parameter id
]