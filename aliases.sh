# General
alias l="less"
alias ls="ls --color=auto --ignore=\"*~\""
alias s="ls"
alias ll="ls -lh"
alias py="python -u"
alias python3="py"
alias amke="make"


# git quick commands
if [ -e ~/.git_commands.sh ]
then
  source ~/.git_commands.sh
fi

alias gut="git"
alias got="git"

alias branch="git branch"
alias fetch="git fetch"
alias rebase="git rebase"
alias co="git checkout"

alias stat="git -p status -uno"
alias sha="git rev-parse --verify --short HEAD"
alias smu="git submodule update --init --recursive"
alias amend="git commit -a --amend --no-edit"
alias log="git log --abbrev-commit --decorate --date=format:'%Y-%m-%d %H:%M' --format=format:'%C(bold blue)%h%C(reset) - %C(dim green)%cd%C(reset) - %C(dim cyan)%an%C(reset) - %C(white)%s%C(reset) %C(bold yellow)%d%C(reset)'"

alias rbd="git fetch && git rebase origin/develop"
alias rbm="git fetch && git rebase origin/master"
alias rbi="git rebase -i"

alias cod="git fetch && git checkout origin/develop -B develop"
alias com="git fetch && git checkout origin/master -B master"

alias g="git push origin HEAD:refs/for/develop"
alias gm="git push origin HEAD:refs/for/master"
alias rbdg="rbd && g"
alias rbmg="rbm && gm"
alias ag="amend && g"
alias agm="amend && gm"


function commit()
{
  # Usage: commit My commit message header line
  message="${@}"
  git commit -a -m "${message}"
}


function wip()
{
  # Make a work-in-progress commit. With or without a describing commit message.
  if [ ${#} -eq 0 ]
  then
    message="WIP"
  else
    message="WIP: ${@}"
  fi
  commit "${message}"
}


function squash()
{
  # Checkout to a squash branch
  local branch_name=$(get_git_branch)
  git checkout -b ${branch_name}-squash
}


function rb()
{
  # Rebase, with or without commit argument.
  if [ ${#} -eq 0 ]
  then
    commit="HEAD~10"
  else
    commit=${1}
  fi
  git rebase -i ${commit}
}


# Directories
alias cc="cd .."
alias ccc="cd ../.."
alias cccc="cd ../../.."
alias ccccc="cd ../../../.."
alias cccccc="cd ../../../../.."
alias ccccccc="cd ../../../../../.."
