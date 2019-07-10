import requests,json
url='http://openapi.tuling123.com/openapi/api/v2'
apiKey='85ea87f6df3d4c1f9a7be20c6801ab9e'
userId='ZYsfirstbotoftuling'
headers={'content-type': 'application/json'}
data={}
data['reqType']=0
data['perception']={"inputText": {"text": "扫荡副刊了角色的佛教克斯的佛教看来"},
                    'selfInfo':{"location": {"city": "重庆","province": "北碚","street": "蔡家"}}}
# data['selfInfo']={"location": {"city": "重庆","province": "北碚","street": "蔡家"}}
data['userInfo']={'apiKey':apiKey,'userId':userId}
req=json.dumps(data).encode('utf-8')
resp=requests.post(url=url,data=req)
text=json.loads(resp.text)
resp_text=(((text['results'])[0])['values'])['text']