

#
# Set the prompt
#
export PROMPT_COMMAND=__prompt_command

function __prompt_command() # Function run after every command
{
  local exit_code="$?" # Last exit code (this needs to be first)
  local branch_name=$(get_git_branch)

  local reset_color='\[\e[0m\]' # Regular color
  local red='\[\e[1;31m\]' # Bold red
  local blue='\[\e[1;34m\]' # Bold blue


  #
  # Append last command to history
  #
  history -a


  #
  # Set the prompt
  #
  PS1="" # Reset

  # Set window title
  PS1="\[\e]0;\u@\h: \w\a\]"

  # Hostname/branch in prompt
  if [ -n "${branch_name}" ]; then
    PS1+=${branch_name}
  else
    # Not in a git repo. Use hostname instead.
    PS1+="\h"
  fi

  # Add warning message if last exit code not 0
  if [ ${exit_code} != 0 ]; then
    PS1+=" [${red}ERROR: ${exit_code}${reset_color}]"
  fi

  # Display path. Shorten if too long.
  local pwd_length=40
  local new_pwd="${PWD/#$HOME/~}"

  if [ $(echo -n ${new_pwd} | wc -c | tr -d " ") -gt ${pwd_length} ]
  then
    new_pwd=$(echo -n ${new_pwd} | awk -F '/' '{print $1 "/" $2 "/.../" $(NF-1) "/" $(NF)}')
  fi

  PS1+=" [${blue}${new_pwd}${reset_color}]"
  PS1+="\$ "
}


#
# Set PATH
#

# Add lmutil
PATH=${PATH}:/c/Xilinx/Vivado/2017.2/bin/unwrapped/win64.o


#
# Git commands
#
if [ -e ~/git_commands.sh ]
then
    source ~/git_commands.sh
fi


#
# Aliases
#
if [ -e ~/.aliases.sh ]
then
    source ~/.aliases.sh
fi


#
# Local aliases
#
if [ -e ~/.local_aliases.sh ]
then
    source ~/.local_aliases.sh
fi


# 
# SHELL history
#
HISTCONTROL=ignoreboth:erasedups
HISTFILESIZE=1000000
HISTSIZE=1000000
shopt -s cmdhist
shopt -s histappend

