import pymysql


def connect():
    conn = pymysql.connect(host='localhost', user='root', password='Bie15818599035',
                           database='library')  # 连接MySQL数据库library
    cursor = conn.cursor()
    return cursor, conn
