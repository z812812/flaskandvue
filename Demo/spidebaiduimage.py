import requests, re

url = r'http://image.baidu.com/search/flip?tn=baiduimage&ipn=r&ct=201326592&cl=2&lm=-1&st=-1&fm=result&fr=&sf=1&fmq=14974' \
      r'91098685_R&pv=&ic=0&nc=1&z=&se=1&showtab=0&fb=0&width=&height=&face=0&istype=2&ie=utf-8&ctd=1497491098685%5E00_1519X735&word=%E8%8B%8D%E8%80%81%E5%B8%88'
r = requests.get(url).text

pattern =r'<input name="(.*?)" type'
dd=re.findall(pattern,r)
print(dd)
