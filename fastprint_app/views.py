from django.shortcuts import render, redirect #modul render digunakan untuk mengembalikan render html dengan data dictonary yang akan dikirimkan
import requests #modul request digunakan untuk membuat permintaan ke server external 
import hashlib #modul ini digunakan untuk hashing string 
from django.http import JsonResponse #modul jsonresponse digunakan untuk mengembalikan data berupa json
from .models import * # Mengimport model di file models.py
from rest_framework.parsers import JSONParser # digunakan untuk mengurai data json
from rest_framework.decorators import api_view # decorator yang digunakan untuk mendefinisikan method api 
from .serializer import * # Mengambil semua class di file serializer.py
from rest_framework.response import Response # Menampilkan response yang dikirim dari apa
from rest_framework import status # menampilkan status dari api yang diakses


def delete(request, id):
    try:
        data = Produk.objects.get(id_produk = id) # Mengambil data berdasarkan parameter url yg dikirimkan
        data.delete() # Mengahapus data 
        return JsonResponse({'success': True}) # Mngembalikan respon ke alert True
    except Exception as f: 
        error_message = "Terjadi kesalahan karena " + str(f) # Digunakan untuk memberikan pesan jika terjadi kesalahan saat menghapus data
        return JsonResponse({'success': False, 'error_message': error_message})
    
def ubah(request, id):
    if request.method == 'GET':
        kategori = Kategori.objects.all() # Mengambil data pada model kategori
        status = Status.objects.all() # Mengambil data pada model status 
        data = Produk.objects.get(id_produk = id) # Mengambil data yang id_produk nya sama dengan id yang dikirimkan

        # Menyimpanya kedalah variabel diktonary bernama x dan mengimnya ke template 
        x = {                               
            'kategori' : kategori,
            'status' : status,
            'data' : data,
            'edit' : 'true',
        }
        return render(request, 'create.html', x)
    
    if request.method == 'POST':
        # Mengambil semua name yang ada di inputan html
        # id = request.POST.get('id')
        nama = request.POST.get('nama')
        harga = int(request.POST.get('harga'))

        # Mengambil data dari model kategori
        kategori = request.POST.get('kategori')
        dt_kat = Kategori.objects.get(id_kategori = kategori)

        # Mengambil data dari model status
        status = request.POST.get('status')
        dt_status = Status.objects.get(id_status = status)

        # Mengunakan try and catch untuk menyimpan data
        try:
            produk = Produk.objects.get(id_produk = id)
            produk.nama_produk = nama
            produk.harga = harga
            produk.kategori = dt_kat
            produk.status = dt_status 

            produk.save()
        except Exception as f:
            print(f) # Mencetak kesalahan di terminal

        return redirect('app:admin_produk')
    
def produk(request):
    if request.method == 'GET':
        data = Produk.objects.filter(status_id__nama_status = 'bisa dijual') # Menampilkan data dari tabel produk dengan filter nama status 'bisa dijual'
        x = {
            'data' : data,
        }
        return render(request, 'dashboard.html', x)
    
def tambah(request):
    if request.method == 'GET':
        kategori = Kategori.objects.all() # Mengambil data pada model kategori
        status = Status.objects.all() # Mengambil data pada model status 
        
        # Menyimpanya kedalah variabel diktonary bernama x dan mengimnya ke template 
        x = {                               
            'kategori' : kategori,
            'status' : status,
        }
        return render(request, 'create.html', x)
    
    if request.method == 'POST':
        id = request.POST.get('id')
        nama = request.POST.get('nama')
        harga = int(request.POST.get('harga'))
        kategori = request.POST.get('kategori')
        dt_kat = Kategori.objects.get(id_kategori = kategori)
        status = request.POST.get('status')
        dt_status = Status.objects.get(id_status = status)
        try:
            produk = Produk(
                id_produk = id,
                nama_produk = nama,
                harga = harga,
                kategori = dt_kat,
                status = dt_status
            )
            produk.save()
        except Exception as f:
            print(f)
        return redirect('app:admin_produk')


@api_view(['POST'])
def kategoriAPI(request):
    if request.method == 'POST':
        data = JSONParser().parse(request)
        serializer = KategoriSerializer(data=data)  

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
@api_view(['POST'])
def statusAPI(request):
    if request.method == 'POST':
        data = JSONParser().parse(request)
        serializer = StatusSerializer(data=data)  

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
def get_api(request):
    if request.method == 'GET':
        return render(request, 'dashboard.html')
    
    if request.method == 'POST':
        # Data yang akan dikirim dalam permintaan POST
        username = 'tesprogrammer230923C19'
        password_md5 = hashlib.md5('bisacoding-23-09-23'.encode()).hexdigest()

        # URL API eksternal
        api_url = 'https://recruitment.fastprint.co.id/tes/api_tes_programmer'

        # Data yang akan dikirim dalam permintaan POST
        data = {
            'username': username,
            'password': password_md5
        }

        try:
            # Melakukan permintaan POST ke API eksternal
            response = requests.post(api_url, data=data)

            # Mengambil data header dari response
            headers = response.headers

            # Contoh: Cetak semua header respons
            print("Headers:")
            for key, value in headers.items():
                print(f"{key}: {value}")
            api_data = response.json()
            return JsonResponse(api_data)
           
        except Exception as e:
            # Mengembalikan pesan kesalahan jika terjadi masalah dalam permintaan
            return JsonResponse({'error': str(e)}, status=500)
    else:
        # Mengembalikan pesan kesalahan jika permintaan bukan POST
        return JsonResponse({'error': 'Permintaan harus menggunakan metode POST'}, status=405)
    


