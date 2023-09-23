from .models import * # mengambil semua model
from rest_framework import serializers # mengimport modul serializer dari django rest framework

class KategoriSerializer(serializers.ModelSerializer):
    class Meta:
        model = Kategori
        fields = ['id_kategori', 'nama_kategori']

class StatusSerializer(serializers.ModelSerializer):
    class Meta:
        model = Status
        fields = ['id_status', 'nama_status']