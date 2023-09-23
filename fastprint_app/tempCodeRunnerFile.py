
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

            # Memeriksa apakah permintaan berhasil (kode status HTTP 200)
            if response.status_code == 200:
                # Mengambil data respons dari API
                api_data = response.json()

                # Mengembalikan data respons dalam format JSON
                return JsonResponse(api_data)
            else:
                # Jika permintaan gagal, mengembalikan pesan kesalahan
                return JsonResponse({'error': 'Permintaan ke API gagal'}, status=500)
        except Exception as e:
            # Mengembalikan pesan kesalahan jika terjadi masalah dalam permintaan
            return JsonResponse({'error': str(e)}, status=500)
    else:
        # Mengembalikan pesan kesalahan jika permintaan bukan POST
        return JsonResponse({'error': 'Permintaan harus menggunakan metode POST'}, status=405)