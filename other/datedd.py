#coding=utf-8
import re, requests, random
from demo import download_img

id='246478' \
   ''
count=0
for i in range(1,100):
    url = "https://www.gaoxiaoba.com/gif/{}_{}.html".format(id,i)
    rep = requests.get(url)
    rep.encoding='utf-8'
    pattner = r'''<img src="(.*?)" /></a></p>'''
    r = re.findall(pattner, rep.text)
    if len(r)==0:
        print('这页为空')
        count+=1
    else:
        download_img(r[0])
    if count>3:
        print("下载完毕")
        break
    print(r)


