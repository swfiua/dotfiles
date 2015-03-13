# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
. .all_shells

if [ "" == "$CYGWIN" ]; then
    PATH=`uniquify $PATH:/sbin:/usr/sbin:~/bin`
fi

