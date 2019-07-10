
import time,ssl

ssl._create_default_https_context = ssl._create_unverified_context

b = time.time()
ti = str(b).replace('.','').strip()[:13]

import requests
cookie = ''
headers = {}
site = 'https://192.168.16.22:9801/svr/local/users/lastlogininfo?_dc='+ti
print(site)
resp = requests.get(site,verify = False)
print(resp.text)
