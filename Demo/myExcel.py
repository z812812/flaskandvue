from xlrd import *
from getsql import getsql

file = r"f:\up.xls"


def xlrd_tosqlserver(file):
    # 用open_workbook方法打开文件
    workbook = open_workbook(file)
    # 用sheet_by_index获取工作表
    sheet1 = workbook.sheet_by_index(0)
    # 获取列数和行数
    row = sheet1.nrows
    # col=sheet1.ncols
    # print('{},{}'.format(row,col))
    # 获取某行的值
    # print(sheet1.row_values(0))
    dropsql = r"delete from zyschangeorderdate"
    getsql().inert(dropsql)
    for i in range(1, row):
        row_values = sheet1.row_values(i)
        a = row_values[0]
        b = int(row_values[1])
        c = row_values[2]
        sql = r"insert into zyschangeorderdate values ('{}','{}','{}')".format(a, b, c)
        # print(sql)
        r = getsql().inert(sql)

    execsql = r"exec proc_zyz_changeOrderDate"
    r1 = getsql().inert(execsql)
    # print(r1)
    # 获取某列的值
    # print(sheet1.col_values(2))


if __name__ == "__main__":
    xlrd_tosqlserver(file)
