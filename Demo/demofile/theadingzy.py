from concurrent.futures import ThreadPoolExecutor
import time, requests, re, random

# submit需要方法和参数，map需要方法和字典

# date = []
# for i in range(1, 8):
#     for j in range(1, 30):
#         date.append('0{}0{}'.format(i, j)) if j < 10 else date.append(('0{}{}'.format(i, j)))
# # print(date)
# url_list = ['https://qingniantuzhai.com/qing-nian-tu-zhai-{}-2/'.format(x) for x in date]


def w_url_txt(content):
    with open(r'e:\zzy\a.txt', 'a+', encoding='utf-8') as f:
        f.write(content + '\n')


# for i in range(len(url_list)):
#     url = url_list[i]
#     pattern = r'''<img src="(.*?)" alt='''
#     r = requests.get(url).text
#     list = re.findall(pattern, r)
#     list_img = [x for x in list if 'http' in x and 'banner' not in x]
#     print('正在下载{}'.format(url[-7:-3]))
#     with ThreadPoolExecutor(10) as tp:
#         tp.map(w_url_txt, list_img)


def sayHello(url):
    resp = requests.get(url).content
    path = r'e:\zzy\{}.{}'.format(random.random() * 100, url[-3:])
    with open(path, 'wb') as f:
        f.write(resp)


def w_txt():
    with open(r'e:\zzy\a.txt', 'r', encoding='utf-8') as f:
        result = f.read().split('\n')
        # print([x for x in result if '' not in x])
        with ThreadPoolExecutor(30) as tp:
            tp.map(sayHello,result)

def main():
    w_txt()


if __name__ == '__main__':
    main()
