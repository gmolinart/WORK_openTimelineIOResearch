import sys 
from PySide6.QtQml import QQmlApplicationEngine 
from PySide6.QtWidgets import QApplication, QWidget
import os 

class Window(QWidget):
    def __init__(self ):
        super().__init__()



app = QApplication(sys.argv)
engine = QQmlApplicationEngine()

window = Window()
engine.rootContext().setContextProperty('window', window)
# Loading the Media.qml file.
engine.load('Media.qml')
# engine.load('elements/Timeline.qml')
# engine.load('Bar.qml')
sys.exit(app.exec())