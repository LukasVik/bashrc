# General
alias l="less"
alias ls="ls --color=auto"
alias s="ls"
alias ll="ls -lh"
alias py="python -u"
alias python3="py"
alias np="/c/Program\ Files\ \(x86\)/Notepad++/notepad++.exe"


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
alias commit="git commit"
alias co="git checkout"

alias stat="git -p status -uno"
alias sha="git rev-parse --verify --short HEAD"
alias wip="git commit -am \"-WIP\""
alias smu="git submodule update --init --recursive"
alias amend="git commit -a --amend --no-edit"
alias log="git log --abbrev-commit --decorate --format=format:'%C(bold blue)%H%C(reset) - %C(dim cyan)%an%C(reset) - %C(white)%s%C(reset) %C(dim white) %C(bold yellow)%d%C(reset)'"

alias rbd="git fetch && git rebase origin/develop"
alias rbm="git fetch && git rebase origin/master"

alias cod="git fetch && git co origin/develop -B wi-502016-develop"
alias com="git fetch && git co origin/master -B wi-502016-master"

alias g="git push origin HEAD:refs/for/develop"
alias gm="git push origin HEAD:refs/for/master"
alias rbdg="rbd && g"
alias rbmg="rbm && gm"
alias ag="amend && g"
alias agm="amend && gm"

function squash()
{
  # Checkout to squash branch
  local branch_name=$(get_git_branch)
  if [ -n "${branch_name}" ]; then
    git checkout -b ${branch_name}-squash
  else
    # Not in a git repo
	return 1
  fi
}

function rbl()
{
  # Rebase local. With or without argument for how many commits to view.

  if [ $# -eq 0 ]
  then
    commit="HEAD~10"
  else
    commit="HEAD~"$1
  fi
  git rebase -i ${commit}
}


# Check modelsim licenses
alias lic="lmutil.exe lmstat -f msimpevsim"
alias lrm="lmutil.exe lmremove msimpevsim"


# directories
alias cc="cd .."
alias ccc="cd ../.."
alias cccc="cd ../../.."
alias ccccc="cd ../../../.."
alias cccccc="cd ../../../../.."
alias ccccccc="cd ../../../../../.."
