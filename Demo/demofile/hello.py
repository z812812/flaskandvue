import os, time
st="字节=32"
cmd1="ping 192.168.16.22"
cmd2="ping 192.168.16.83"
cmd3="ping 192.168.16.2"
cmd4="ping 192.168.16.45"

def test(cmd):
    aa = os.popen(cmd)
    if st in aa.read():
        return 1
    else:
        return 0

def shutdown():
    cmd5="shutdown -s -f -t 0"
    os.popen(cmd5)

if __name__=='__main__':
    while True:
        print("请不要关闭该窗口......")
        with open(r'e:\a.txt','a+',encoding='utf-8') as f:
            f.write(time.strftime('%Y.%m.%d %H:%M:%S',time.localtime(time.time()))+'我还活着！！！！\n')
        if not(test(cmd1)) and not(test(cmd2)) and not(test(cmd3)) and not(test(cmd4)):
            shutdown()
        time.sleep(180)
