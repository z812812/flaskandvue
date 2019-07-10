#_*_ coding:utf-8 _*_
import requests
from bs4 import BeautifulSoup
if __name__=='__main__':
    target = 'https://www.biqukan.com/1_1094/5403177.html'
    req = requests.get(url=target)
    html = (req.text)
    bs = BeautifulSoup(html)
    texts = bs.find_all('div',class_='content')
    print(texts)

