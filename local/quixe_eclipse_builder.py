#!/usr/bin/python
#call from javascript-source on save to update serverfiles

import os
import shutil

class Builder(object):
    src_dir = ""; dst_dir = ""
    def setup(self):
        dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        print "basedir " + dir
        os.chdir( dir )
        
    def run(self):
        #old path has spaces, not on static appengine..
        dst = "spaceless_named/Hack_Hooks_Demo"
        src = "ide/Hack_Hooks_Demo Materials"
        if os.path.exists(dst):
            shutil.rmtree(dst)
        shutil.copytree(src,dst)
        
        print "copied"

if __name__ == '__main__':
    print "quixe_builder " + __file__
    b = Builder()
    b.setup()
    b.run()


    
