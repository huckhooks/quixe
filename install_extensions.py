#!/usr/bin/python

import sys
import os
import shutil
from glob import glob
import traceback
import re

inform7 = os.path.expanduser("~/Inform")
dir = os.path.dirname(os.path.abspath(__file__))

if __name__ == '__main__':
    try:
        os.chdir(dir)
        dst = ''
        for file in glob("Extensions/*.i7x"):
            print file
            with open(file, 'r') as fd:
                top = fd.readline()
                print top
                m = re.search('(.* of )?(.*) by (.*) begins here.\n',top)
            author = m.group(3)
            title = m.group(2)              

            p = os.path.join(inform7,"Extensions",author)
            if not os.path.exists(p):
                    os.makedirs(p)
            p = os.path.join(inform7,"Extensions",author, title + ".i7x")
            print p
            shutil.copyfile(file, p)
    except:
        traceback.print_exc()
        #raw_input('Press return to close xterm ')
        print "done"
