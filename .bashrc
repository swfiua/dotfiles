# .bashrc


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

. ~/.all_shells


#  2. Add a line like "export WORKON_HOME=$HOME/.virtualenvs" to your .bashrc.
#  3. Add a line like "source /path/to/this/file/virtualenvwrapper.sh" to your .bashrc.
#export WORKON_HOME=$HOME/.virtualenvs
#source /usr/local/bin/virtualenvwrapper.sh

# add bash completion magic
if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion

	# modified copy from /etc/bash_completion -- add pyw
	_python()
	{
	    local cur

	    COMPREPLY=()
	    cur=${COMP_WORDS[COMP_CWORD]}

	    # first parameter on line a Python script?
	    if [ $COMP_CWORD -eq 1 ] && [[ "$cur" != -* ]]; then
		_filedir '@(py|pyw|pyc|pyo)'
	    fi

	    return 0
	}
	# below is attempt to get python completion going better
	# so far doesn't quite work -- -o filenames was used instead
	# of -o default because if doesn't append ' ' to directories
	# ... but filenames doesn't do words after the first..
	complete -F _python -o filenames python

	# for now just disable python completion magic
	complete -r python
fi

if [ ${EMACS:-n} != t ]; then
   PS1="\[\e[01;33m\]\u@\h \w>\n\[\e[01;33m\][\t]\[\e[00m\] "
   PS1="\[\e[01;34m\]\u@\h \w>\n\[\e[01;34m\][\t]\[\e[00m\] "
fi

INPUTRC=~/.inputrc
# [ -x /usr/bin/most ] && export PAGER=most
history_control=ignoredups
#eval `dircolors -b $HOME/.coloursrc`
    
alias h="history 20"
alias ll="ls --color=tty -al"
alias l="ls --color=tty -F"
alias p=less
alias rid="rm -f"
alias pygrep="find -name '*.py' | xargs grep"
alias o=xdg-open
alias cdp='colordiff|less -R'
alias stop="sudo shutdown -h now"


function boldps
{
    export PS1="\[\e[01;33m\]\u@\h \w>\n\[\e[01;33m\][\t]\[\e[00m\] "
}

function simpleps
{
    export PS1="\u@\h >"
}

function fp
{
  find . -name "*${1}*" -print 
}
function f
{
  fields=$1
  shift
  cut -d, -f$fields $*
}

function uniquify
{
    xIFS=$IFS
    IFS=":"
    items=$1
    result=""
    for x in $items; do
	if [ "$result" = "" ]; then
	    result=$x
	else
	    for y in $result; do
		if [ "$x" = "$y" ]; then
		    break
		fi
	    done
	    if [ "$x" != "$y" ]; then
		result="$result:$x"
	    fi
	fi
    done

    IFS=$xIFS
    echo $result     
}

function ep
{
    # like cd only better (if a bit scratchy)
    if [ $# -eq 0 ]; then
	cd
    else
	if [ -d $1 ]; then
	    cd $1
	else
	    cd `dirname $1`
	fi
    fi
}

# magic to put magic in the xterm title
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

# expand ~ in case we are in sh
eval homedir=~
export PATH="$PATH:$homedir/.local/bin"
alias aa=ack-grep
alias pac="sudo pacman -S"

PY=3

alias pie="python$PY"
alias pop="pip$PY"
alias eric="idle-python$PY"

function karma
{

    module=karmapi.$*
    pie -m $module
}

