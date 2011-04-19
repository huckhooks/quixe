#!/usr/bin/python

# ./install-inform7.sh --prefix ~/Inform/cli

import os
import shutil
import subprocess

if __name__ == '__main__':

    #import webbrowser does only work with firefox
    #firefox does not raise window, opera not, chromium yes
    browser = "/usr/bin/chromium-browser"
    
    project_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    os.chdir(project_dir)
    
    url = "file://" + project_dir + "/play-full.html"
    print url
    
    
    proc = subprocess.Popen([browser,url])
    ret = proc.wait()
    if (ret):
        raise Exception('Process result code %d' % (ret,))
