#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliases and colors
alias ls='ls --color=auto'
alias la='ls -a --color=auto'
alias ll='ls -l --color=auto'
alias grep='grep --color=auto'
alias vtop='vtop -t wizard'
alias neofetch='fastfetch'
RED='\033[0;31m'

# This function returns '' in all below cases:
  #   - git not installed or command not found
  #   - not in a git repo
  #   - in a git repo but not on a branch (HEAD detached)
git_stuff() {
  git_branch=$(git branch --show-current 2> /dev/null)
  if [[ $git_branch == "" ]];then
    echo -e ""
  elif [[ $git_branch == *"Nocommit"* ]];then
    echo -e "No commits"
  else
    echo -e "${RED}($git_branch)\033[0m"
    #echo -e "\033[0m"
  fi
}
prompt() {
  PS1="[\u@\h \W]$(git_stuff)$ "
}
PROMPT_COMMAND=prompt

./.config/hypr/test_script.sh ~/.config/hypr/script_lines.txt

#export PATH="$PATH:/home/boggle/.local/bini"
