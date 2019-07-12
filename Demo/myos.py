import os,sys
# print(os.path.abspath(sys.path[0]))



with open(sys.path[0]+'\\ta.txt','a+',encoding='utf-8') as f:
    f.write('你好，你是谁\r\n')


with open(sys.path[0]+'\\ta.txt','r',encoding='utf-8') as f:
    print(f.read())
