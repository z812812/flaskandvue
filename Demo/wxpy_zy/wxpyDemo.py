from wxpy import *
import requests,json

bot = Bot(cache_path=True)
# friend = bot.friends().search('王凤兰')
friend2 = bot.friends().search('晨妈')
print('机器人上线')

def rep(text,userID):
    url = 'http://openapi.tuling123.com/openapi/api/v2'
    apiKey = '85ea87f6df3d4c1f9a7be20c6801ab9e'
    userId = 'ZYsfirstbotoftuling'
    headers = {'content-type': 'application/json'}
    data = {}
    data['reqType'] = 0
    data['perception'] = {"inputText": {"text": text},
                          'selfInfo': {"location": {"city": "重庆", "province": "北碚", "street": "蔡家"}}}
    # data['selfInfo']={"location": {"city": "重庆","province": "北碚","street": "蔡家"}}
    data['userInfo'] = {'apiKey': apiKey, 'userId': userID}
    req = json.dumps(data).encode('utf-8')
    resp = requests.post(url=url, data=req)
    text = json.loads(resp.text)
    resp_text = (((text['results'])[0])['values'])['text']
    return resp_text
# @bot.register(friend)
# def rsp_text(msg):
#     url = "http://api.qingyunke.com/api.php?key=free&appid=0&msg={}".format(msg.text)
#     result = requests.get(url)
#     msg1 = result.content.decode('utf-8')
#     msg2 = msg1[23:]
#     msg3 = msg2[:-2]
#     return msg3


@bot.register(Friend,TEXT)
def rsp_text(msg):
    return rep(msg.text,'friend2')

#
# @bot.register()
# def rsp_text(msg):
#     return rep(msg.text,'friend')

# bot.join()
embed()
