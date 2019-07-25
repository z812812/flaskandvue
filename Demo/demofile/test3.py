import requests

url="https://actweb.cqliving.com/act/vote/index.html"
url2='https://exapi.cqliving.com/'

data={
    'sessionId':'',
    'actCode':'zkJh3gOwB4Nb6CRtr6iP6BxveHb5xv',
    'isApp':1,
    'token':'',
    'type':'',
    'itemId':'104623',
    'appId':'15'
}
r=requests.get(url=url,data=data)
print(r.text)

