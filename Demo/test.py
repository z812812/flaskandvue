from getsql import getmysql,getsql
sql="exec proc_zy_processflow '16000', 1"
# sql="exec pp"
print(sql)

sqlserver_query=getsql().query(sql)

for i in sqlserver_query:

    print(i)


