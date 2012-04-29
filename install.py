import os
import os.path
import subprocess

def main():
    install()


def install():
    vimdir = os.path.expanduser(os.path.join('~', '.vim'))
    os.mkdir(vimdir)
    os.mkdir(os.path.join(vimdir, 'tmp'))
    os.mkdir(os.path.join(vimdir, 'bundle'))
    subprocess.check_call(['git.cmd', 'clone',
        'https://github.com/gmarik/vundle.git',
        os.path.join(vimdir, 'bundle', 'vundle')])
    subprocess.check_call([os.path.expandvars('$COMSPEC'), '/c', 'mklink',
        os.path.join(os.path.expanduser('~'), '_vimrc'), os.path.join('vimconfig', '_vimrc')])

if __name__ == '__main__':
    main()
