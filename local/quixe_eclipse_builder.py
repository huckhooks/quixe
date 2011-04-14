#!/usr/bin/python
#call from javascript-source on save to update serverfiles

import os
import shutil
import subprocess

project_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
cli_inform7 = os.path.expanduser("~/Inform/cli/bin/i7")
i7_project = os.path.join(project_dir,"ide")
    
def build_story():
    if not os.path.exists(cli_inform7):
        print "Warning: no cli-inform installed, ignoring"
        return
    
    os.chdir(i7_project)
      
    proc = subprocess.Popen([
                             cli_inform7,
                             '-r','Hack_Hooks_Demo.inform',
                             '-s', 'blorb=1,zcode=g'
                             ]
                          )
    ret = proc.wait()
    if (ret):
        raise Exception('Process result code %d' % (ret,))

def copy_spaceless():
    #old path has spaces, not on static appengine..
    os.chdir( project_dir )
    dst = "spaceless_named/Hack_Hooks_Demo"
    src = "ide/Hack_Hooks_Demo Materials"
    if os.path.exists(dst):
        shutil.rmtree(dst)
    shutil.copytree(src,dst)
    
    print "copied to spaceless"
   
def build():
    build_story()
    copy_spaceless()

if __name__ == '__main__':
    print "quixe_builder " + __file__
    build()


    
