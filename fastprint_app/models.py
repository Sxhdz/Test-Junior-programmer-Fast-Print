from django.db import models

# Create your models here.

#Model kategori
class Kategori(models.Model):
    id_kategori = models.AutoField(primary_key=True, unique=True)
    nama_kategori = models.TextField(null=True)

class Status(models.Model):
    id_status = models.AutoField(primary_key=True, unique=True)
    nama_status = models.TextField(null=True)

class Produk(models.Model):
    id_produk = models.AutoField(primary_key=True, unique=True)
    nama_produk = models.TextField(null=True)
    harga = models.IntegerField(null=True)
    kategori = models.ForeignKey(Kategori, on_delete=models.PROTECT)
    status = models.ForeignKey(Status, on_delete=models.PROTECT)