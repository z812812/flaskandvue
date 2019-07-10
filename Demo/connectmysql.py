import pymysql
from pprint import pprint
tp = ('localhost','root','','demo')
db = pymysql.connect(*tp)
cursor = db.cursor()
cursor.execute('select * from dd')
data = cursor.fetchall()
pprint(data)



sql = "INSERT INTO dd values ('%s','%s')" % ('13489','124')
sql1 = "delete from dd where mcmc like '%s'" % '1'
try:
    cursor.execute(sql)
    db.commit()
except:
    db.rollback()
finally:
    db.close()
