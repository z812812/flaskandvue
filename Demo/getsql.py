# coding=utf-8
import pymssql, json, pymysql


# sqlserver数据库
class getsql:
    _db = None
    _config = {
        "server": '192.168.16.11',
        "user": 'sa',
        "password": 'Sa123456',
        "database": 'ufdata_003_2016'
    }

    # 创建连接
    def conn(self):
        if (self._db == None):
            self._db = pymssql.connect(**self._config)
        return self._db

    def __init__(self):
        self.conn()

    def __del__(self):
        if (self._db is not None):
            self._db.close()

    def query(self, sql):
        cursor = self.conn().cursor(as_dict=True)
        try:
            cursor.execute(sql)
            return cursor.fetchall()
        except:
            pass
        finally:
            cursor.close()

    def inert(self, sql):
        cursor = self.conn().cursor()
        try:
            cursor.execute(sql)
            self._db.commit()
            return cursor.rowcount
        except:
            pass
        finally:
            cursor.close()


# mysql数据库

class getmysql:
    _db = None
    _config = {
        "host": "192.168.16.83",
        "port": 3306,
        "user": "root",
        "password": "password",
        "db": "gz",
        "cursorclass": pymysql.cursors.DictCursor
    }

    def conn(self):
        if (self._db is None):
            self._db = pymysql.connect(**self._config)
        return self._db

    def __init__(self):
        self.conn()

    def __del__(self):
        self._db.close()

    def query(self, sql):
        cursor = self._db.cursor()
        try:
            cursor.execute(sql)
            return cursor.fetchall()
        except:
            pass
        finally:
            cursor.close()

    def insert(self, sql):
        cursor = self._db.cursor()
        try:
            cursor.execute(sql)
            self._db.commit()
            return cursor.rowcount
        except:
            pass
        finally:
            cursor.close()

    def update_msg(self, openid):
        sql = "update userinfo set logintime=logintime+1,lastdate=now() where openid='{}'".format(openid)
        cursor = self._db.cursor()
        try:
            cursor.execute(sql)
            self._db.commit()
        except:
            pass
        finally:
            cursor.close()
