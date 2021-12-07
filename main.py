import sys
import pymysql
import time
from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow, QMessageBox
from login import Ui_Login
from reader import Ui_Reader
from connect import *
from information_manager import Ui_systemadmin
from book_manager import Ui_bookadmin

cursor, conn = connect()


class Readerui(QtWidgets.QMainWindow, Ui_Reader):
    def __init__(self, parent=None):
        super(Readerui, self).__init__(parent)
        self.setupUi(self)


class bookadminui(QtWidgets.QMainWindow, Ui_bookadmin):
    def __init__(self, parent=None):
        super(bookadminui, self).__init__(parent)
        self.setupUi(self)


class sysadminui(QtWidgets.QMainWindow, Ui_systemadmin):
    def __init__(self, parent=None):
        super(sysadminui, self).__init__(parent)
        self.setupUi(self)


class MyMainForm(QMainWindow, Ui_Login):
    def __init__(self, parent=None):
        super(MyMainForm, self).__init__(parent)
        self.setupUi(self)
        self.exitbt.clicked.connect(self.exit)
        self.loginbt.clicked.connect(self.login)

    def exit(self):  # 退出
        rec_code = QMessageBox.question(self, "确认", "您确认要退出吗？", QMessageBox.Yes | QMessageBox.No)
        if rec_code != 65536:
            self.close()

    def login(self):  # 登录
        ID = self.userline.text()  # 账号ID
        PW = self.pwline.text()   # 密码
        if ID == '' or PW == '':
            QMessageBox.warning(self, "警告", "请输入用户名/密码", QMessageBox.Yes)
        else:
            if self.idbox.currentText() == '读者 reader':
                sql = 'select * from readers where ID = "%s" and password="%s"' % (ID, PW)
                res = cursor.execute(sql)
                if res:
                    logintime = time.strftime("%Y-%m-%d", time.localtime())
                    sql = 'select * from loginrecord where time="%s"' % logintime
                    res = cursor.execute(sql)
                    logined = cursor.fetchall()
                    if res:
                        last = logined[-1]
                        number = last[-1]
                        num = number + 1
                        sql = 'INSERT INTO loginrecord(ID,time,number) VALUES(%s,"%s",%d)' % (ID, logintime, num)
                        cursor.execute(sql)
                        conn.commit()
                    else:
                        sql = 'INSERT INTO loginrecord(ID,time,number) VALUES(%s,"%s",%d)' % (ID, logintime, 1)
                        cursor.execute(sql)
                        conn.commit()
                    self.read = Readerui()
                    self.read.show()
                    self.close()
                else:
                    QMessageBox.warning(self, "警告", "密码错误，请重新输入！", QMessageBox.Yes)
            elif self.idbox.currentText() == '图书管理员 book manager':
                type = '图书管理员'
                sql = 'select * from workers where ID = "%s" and password="%s" and type="%s" ' % (ID, PW, type)
                res = cursor.execute(sql)
                # cursor.close()
                # conn.close()
                # 进行判断
                if res:
                    self.bookadmin = bookadminui()
                    self.bookadmin.show()
                    self.close()
                    pass
                else:
                    QMessageBox.warning(self, "警告", "密码错误，请重新输入！", QMessageBox.Yes)
            elif self.idbox.currentText() == '信息管理员 information manager':
                type = '系统管理员'
                sql = 'select * from workers where ID = "%s" and password="%s" and type="%s"' % (ID, PW, type)
                res = cursor.execute(sql)
                # 进行判断
                if res:
                    self.sysadmin = sysadminui()
                    self.sysadmin.show()
                    self.close()
                else:
                    QMessageBox.warning(self, "警告", "密码错误，请重新输入！", QMessageBox.Yes)


# 固定的，PyQt5程序都需要QApplication对象。sys.argv是命令行参数列表，确保程序可以双击运行
app = QApplication(sys.argv)
# 初始化
myWin = MyMainForm()
# 将窗口控件显示在屏幕上
myWin.show()
# 程序运行，sys.exit方法确保程序完整退出。
sys.exit(app.exec_())
