from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.Qt import *


class Ui_Login(object):
    def setupUi(self, Login):
        Login.setObjectName("Login")
        Login.setWindowModality(QtCore.Qt.ApplicationModal)
        Login.resize(652 * 2, 385 * 2)
        # Login.resize(652, 385)
        self.label = QtWidgets.QLabel(Login)
        self.label.setGeometry(QtCore.QRect(20 * 2, 20 * 2, 111 * 9, 41 * 2))
        self.label.setTextFormat(QtCore.Qt.AutoText)
        self.label.setObjectName("label")
        self.user = QtWidgets.QLabel(Login)
        self.user.setGeometry(QtCore.QRect(150 * 2, 90 * 2, 60 * 3+20, 41 * 2))
        self.user.setObjectName("user")
        self.password = QtWidgets.QLabel(Login)
        self.password.setGeometry(QtCore.QRect(150 * 2, 150 * 2, 60 * 3, 26 * 2))
        self.password.setObjectName("password")
        self.identify = QtWidgets.QLabel(Login)
        self.identify.setGeometry(QtCore.QRect(150 * 2, 180 * 2, 91 * 3, 59 * 2))
        self.identify.setObjectName("identify")
        self.userline = QtWidgets.QLineEdit(Login)
        self.userline.setGeometry(QtCore.QRect(290 * 2, 100 * 2, 191 * 2, 21 * 2))
        self.userline.setObjectName("userline")
        self.pwline = QtWidgets.QLineEdit(Login)
        self.pwline.setGeometry(QtCore.QRect(290 * 2, 150 * 2, 191 * 2, 21 * 2))
        self.pwline.setEchoMode(QtWidgets.QLineEdit.Password)
        self.pwline.setObjectName("pwline")
        self.idbox = QtWidgets.QComboBox(Login)
        self.idbox.setGeometry(QtCore.QRect(320 * 2, 200 * 2, 121 * 2, 22 * 2))
        self.idbox.setObjectName("idbox")
        self.idbox.addItem("")
        self.idbox.addItem("")
        self.idbox.addItem("")
        self.loginbt = QtWidgets.QPushButton(Login)
        self.loginbt.setGeometry(QtCore.QRect(250 * 2, 270 * 2, 93 * 2, 28 * 2))
        self.loginbt.setObjectName("loginbt")
        self.exitbt = QtWidgets.QPushButton(Login)
        self.exitbt.setGeometry(QtCore.QRect(420 * 2, 270 * 2, 93 * 2, 28 * 2))
        self.exitbt.setObjectName("exitbt")

        palette = QPalette()

        palette.setBrush(QPalette.Background, QBrush(QPixmap("bg.jpg")))
        self.setPalette(palette)

        self.retranslateUi(Login)
        QtCore.QMetaObject.connectSlotsByName(Login)

    def retranslateUi(self, Login):
        _translate = QtCore.QCoreApplication.translate
        Login.setWindowTitle(_translate("Login", "华南理工大学图书馆管理系统 SCUT Library Management System"))
        self.label.setText(_translate("Login",
                                      "<html><head/><body><p><span style=\" font-size:16pt;font-weight:900;font-family:微软雅黑\">用户登录 Welcome to SCUT Library Management System!</span></p></body></html>"))
        self.user.setText(_translate("Login",
                                     "<html><head/><body><p><span style=\" font-size:14pt;font-weight:900;font-family:微软雅黑\">用户账号 User ID</span></p></body></html>"))
        self.password.setText(_translate("Login",
                                         "<html><head/><body><p><span style=\" font-size:14pt;font-weight:900;font-family:微软雅黑\">密码 Password</span></p></body></html>"))
        self.identify.setText(_translate("Login",
                                         "<html><head/><body><p><span style=\" font-size:14pt;font-weight:900;font-family:微软雅黑\">身份类型 Identity</span></p></body></html>"))
        self.idbox.setItemText(0, _translate("Login", "读者 reader"))
        self.idbox.setItemText(1, _translate("Login", "图书管理员 book manager"))
        self.idbox.setItemText(2, _translate("Login", "信息管理员 information manager"))
        self.loginbt.setText(_translate("Login", "登录 log in"))
        self.exitbt.setText(_translate("Login", "退出 quit"))
