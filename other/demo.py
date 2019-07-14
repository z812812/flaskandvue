import re,requests,random
#
def download_img(url):
    path=r"c:\img"
    name=path+"\\"+str(random.random())[2:]+url[-4:]
    img_resp = requests.get(url).content
    with open(name, 'wb') as f:
        f.write(img_resp)
# dateofzy=""
# month="05"
# for i in range(1,31):
#     if len(str(i))==1:
#         dateofzy="{}0{}".format(month,i)
#     else:
#         dateofzy="{}{}".format(month,i)
#     print(dateofzy)
#     url="https://qingniantuzhai.com/qing-nian-tu-zhai-{}-2/".format(dateofzy)
#     rep=requests.get(url).text
#     pattner=r'''<img src="(.*?)" alt=""'''
#     r=re.findall(pattner,rep)[:-1]
#     count=0
#     for i in range(len(r)):
#         download_img(r[i])
#         count+=1
#         print("正在下载第{}张，一共{}张,日期为{}".format(count,len(r),dateofzy))
#
#
