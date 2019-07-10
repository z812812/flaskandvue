import configparser as con
f = con.ConfigParser()
f.read('/home/zy/test')
fs = f.sections()
g = f.items('nb')
print(f.get('nb','c'))