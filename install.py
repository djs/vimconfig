import os
import os.path
import subprocess

def main():
    install()


def install():
    git = 'git'

    vimdir = os.path.expanduser(os.path.join('~', '.vim'))
    os.mkdir(vimdir)
    os.mkdir(os.path.join(vimdir, 'tmp'))
    os.mkdir(os.path.join(vimdir, 'bundle'))
    subprocess.check_call([git, 'clone',
        'https://github.com/gmarik/vundle.git',
        os.path.join(vimdir, 'bundle', 'vundle')])

    if os.name == 'nt':
        subprocess.check_call([os.path.expandvars('$COMSPEC'), '/c', 'mklink',
            os.path.join(os.path.expanduser('~'), '_vimrc'), os.path.join('vimconfig', '_vimrc')])
    else:
        os.chdir(os.path.expanduser('~'))
        os.symlink(os.path.expanduser('~/vimconfig/_vimrc'), os.path.expanduser('~/.vimrc'))

    subprocess.check_call(['vim', '+BundleInstall', '+qall'])

if __name__ == '__main__':
    main()
