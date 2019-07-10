import pymssql
config = {
    "server":'192.168.16.11',
    "user":'sa',
    "password":'Sa123456',
    "database":'ufdata_009_2016'

}

conn = pymssql.connect(**config)

cursor = conn.cursor(as_dict=True)

sql = "select top 5 * from inventory"

cursor.execute(sql)

result = cursor.fetchall()
print(result)
# for item in result:
#     print(item)
cursor.close()
conn.close()