import re, requests

url = 'https://qingniantuzhai.com/qing-nian-tu-zhai-0713-xin-er-tong-gu-shi/'
r = requests.get(url).text
# print(r)
pattern = r'''<img src="(.*?)" alt='''
pattern2 = r'''<p>(.*?)<br>'''
pattern3 = r"<p>(.*?)</p>"
p4='''<div class="next-post"(.*?)</div>'''
c = re.findall(pattern3,r.replace('<br>','').replace('\n',''))
# print(r.replace('<br>','').replace('\n',''))
# print(c)
for i in range(len(c)-4):
    rr=c[i].replace('alt=','').replace('\"','').replace(' ','').split('<imgsrc=')
    # print(rr)
    print('{}>>>{}'.format(rr[0],rr[1]))
# a=re.findall(pattern,r)
# b=re.findall(pattern2,r)
# print(a)
# print(len(a))
# print(b)
# print(len(b))
