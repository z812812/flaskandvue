import threading, time

# def loop():
#     print("{} is running...".format(threading.current_thread().name))
#     n=0
#     while n<5:
#         n+=1
#         print("{} >>> {}".format(threading.current_thread().name,n))
#         time.sleep(1)
#     print("{} is end".format(threading.current_thread().name))
# print('{} is running de '.format(threading.current_thread().name))
# t=threading.Thread(target=loop)
# t.start()
# t.join()
# print("{} is ended ".format(threading.current_thread().name))
balance = 0
lock=threading.Lock()

def change(n):
    global balance
    balance = balance + n
    balance = balance - n


def run_thread(n):
    for i in range(1000000):
        with lock:
            change(n)

print(time.time())
t1 = threading.Thread(target=run_thread, args=(6,))
t2 = threading.Thread(target=run_thread, args=(8,))
t1.start()
t2.start()
t1.join()
t1.join()

print(balance)
print(time.time())
