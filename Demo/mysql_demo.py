
import pymysql
config = {
    "host":"localhost",
    "port":3306,
    "user":"root",
    "password":"",
    "db":"demo",
    "cursorclass":pymysql.cursors.DictCursor
}

conn = pymysql.connect(**config)
# pymysql.cursors.DictCursor

cursor = conn.cursor()

sql = "select * from dd limit 5;"

cursor.execute(sql)

l = cursor.fetchall()
# print(len(l))
