# Generated by Django 3.0.3 on 2020-04-07 12:04

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Address',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=45)),
                ('last_name', models.CharField(max_length=45)),
                ('company', models.CharField(max_length=200, null=True)),
                ('address1', models.CharField(max_length=250)),
                ('address2', models.CharField(max_length=250, null=True)),
                ('city', models.CharField(max_length=100)),
                ('country', models.CharField(max_length=100, null=True)),
                ('state', models.CharField(max_length=100, null=True)),
                ('phone', models.CharField(max_length=45)),
                ('is_default', models.BooleanField(null=True, verbose_name=False)),
            ],
            options={
                'db_table': 'addresses',
            },
        ),
        migrations.CreateModel(
            name='Postcode',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('postcode', models.CharField(max_length=45)),
                ('shipping_cost', models.DecimalField(decimal_places=2, max_digits=8, null=True)),
            ],
            options={
                'db_table': 'postcodes',
            },
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('email', models.EmailField(max_length=250, unique=True, verbose_name='email')),
                ('password', models.CharField(max_length=500)),
                ('first_name', models.CharField(max_length=45)),
                ('last_name', models.CharField(max_length=45)),
                ('create_at', models.DateTimeField(auto_now_add=True, null=True)),
                ('update_at', models.DateTimeField(auto_now=True, null=True)),
                ('is_delete', models.BooleanField(default=False)),
                ('kakao_id', models.CharField(max_length=250, null=True)),
            ],
            options={
                'db_table': 'users',
            },
        ),
        migrations.CreateModel(
            name='User_address',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('address', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='account.Address')),
                ('user', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='account.User')),
            ],
            options={
                'db_table': 'user_addresses',
            },
        ),
        migrations.AddField(
            model_name='user',
            name='address',
            field=models.ManyToManyField(through='account.User_address', to='account.Address'),
        ),
        migrations.AddField(
            model_name='address',
            name='postcode',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='account.Postcode'),
        ),
    ]
