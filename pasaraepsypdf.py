#!/usr/bin/env python

import os
import sys
import threading

class tarea(threading.Thread):
    def __init__(self,archivo):
        threading.Thread.__init__(self)
        self.archivo=archivo
    def run(self):
        if not os.path.exists(self.archivo[1]):
            os.system("convert " + self.archivo[0] + " " + self.archivo[1])
            os.system("epstopdf " + self.archivo[1])
        
def Uso():
    """
    """
    print sys.argv[0] +  " nombredirectorio"
    exit(-1)

def convertImaToPDF(directorio,listexten=[".svg",".jpg",".bmp",".png",".tiff",".gif"]):
    """
    """
    try:
        lista = [os.path.normcase(f)
                 for f in os.listdir(directorio)]            
        lista = [os.path.join(directorio, f) 
                 for f in lista
                 if os.path.splitext(f)[1] in listexten]
        listasalida = [os.path.splitext(f)[0] + ".eps" for f in lista]
        archivos=zip(lista,listasalida);
        for i in archivos:
            t=tarea(i)
            t.start()
        pass
    except:
        print "algo malo paso"

if(len(sys.argv) == 2):
    convertImaToPDF(sys.argv[1])
else:
    Uso()


    
            

