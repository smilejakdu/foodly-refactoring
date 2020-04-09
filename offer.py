import csv
import os
import re
import jwt
import json

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'foodly_project.settings')

import django

django.setup()

from products.models import Product

'''
product
'''
product_path ='./scrapings/product_scraping_results.csv'

with open(product_path , newline ='') as csvfile:
    data_reader = csv.DictReader(csvfile)
    print(data_reader)
    for row in data_reader:
        print(row)
        exit()
