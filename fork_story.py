#!/usr/bin/python

import os
import sys
import shutil
import uuid
import re
from pprint import pprint

if __name__ == '__main__':

    wd = os.path.dirname(os.path.abspath(__file__))
    os.chdir(wd)
    
    src = sys.argv[1]
    dst = sys.argv[2]
    exts = [".inform", " Materials", "-edit.html"]
    
    for ext in exts:
        if not os.path.exists(src + ext):
            raise Exception("src missing " + src + ext)
    
    for ext in exts:
        if os.path.exists(dst + ext):
            if not dst == "DeletableDummy":
                raise Exception("dst exists " + src + ext)
            else:
                shutil.rmtree(dst + ".inform")
                shutil.rmtree(dst + " Materials")
                os.remove(dst + "-edit.html")
               
        
    shutil.copytree(src + ".inform", dst + ".inform")
    shutil.copytree(src + " Materials", dst + " Materials")
    shutil.copyfile(src + "-edit.html", dst + "-edit.html")
    
    _uuid = '%s' % uuid.uuid4() 
    with open(dst + '.inform/uuid.txt', 'r') as f:
        print f.read(), "\n"
    print _uuid
    with open(dst + '.inform/uuid.txt', 'w') as f:
        f.write(_uuid)
    with open(dst + '.inform/uuid.txt', 'r') as f:
        print f.read(), "\n"
    
    with open(src + '.inform/Source/story.ni', 'r') as fs:
        with open(dst + '.inform/Source/story.ni', 'w') as fd:
            top = fs.readline()
            m = re.search('(.*) by (.*)\n',top)              
            top2 = '"' + dst + '" by ' + m.group(2)
            print top2
            fd.write(top2 + "\n")
            fd.write(fs.read())
       
    


