# Generated by Django 3.2.6 on 2023-09-23 11:48

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Kategori',
            fields=[
                ('id_kategori', models.AutoField(primary_key=True, serialize=False, unique=True)),
                ('nama_kategori', models.TextField(null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Status',
            fields=[
                ('id_status', models.AutoField(primary_key=True, serialize=False, unique=True)),
                ('nama_status', models.TextField(null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Produk',
            fields=[
                ('id_produk', models.AutoField(primary_key=True, serialize=False, unique=True)),
                ('nama_produk', models.TextField(null=True)),
                ('harga', models.IntegerField(null=True)),
                ('kategori', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='fastprint_app.kategori')),
                ('status', models.ForeignKey(on_delete=django.db.models.deletion.PROTECT, to='fastprint_app.status')),
            ],
        ),
    ]
