#!/bin/sh

# Installing dependencies
sudo apt update && sudo apt upgrade -y
sudo apt install -y vim powerline git shellcheck php php-pear npm ripgrep \
        zstd gzip unzip bzip2 fzf
sudo npm install -g jsonlint dockerfile_lint js-yaml
sudo pear install PHP_CodeSniffer

# Variable for naming the conf folder
cf=".juanito_rc"
action=$1
# mkdir $cf

action=$(promptUser "Would you like to install for local or remote machine?" "[l] local / [r] remote. Default l" "lLrR" "l")
# shellcheck disable=SC2034
case "$action" in
    ""|l|L )    install_folder="$HOME" && synergy="true" ;;
    r|R )       install_folder="$HOME/$cf" && synergy="false" ;;
    *)      printError "Invalid option"; exit 1
esac

chown "$(logname)":"$(logname)" -R $install_folder

# # Setting user for the personalized config
# su "$(logname)"<<"EOF"

# Setting git options for vim
git config --global merge.tool vimdiff
git config --global core.excludesfile $install_folder/.gitignore-global

# Cloning public dotfiles
## This dot files will point to different repos with the actual config.
## This will avoid the problems of having $HOME as a full git repo, and treat the directories with configuration files as normal repos.
## The clone process will create a bare repo(--bare), anc get only the latest version (--depth 1).
git clone --bare --depth 1 https://github.com/Juanito87/dotfiles.git $install_folder/.cfg
cd $install_folder
mkdir -p .config-backup && \
/usr/bin/git --git-dir=$install_folder/.cfg --work-tree=$install_folder checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
rm README.md installer.sh
/usr/bin/git --git-dir=$install_folder/.cfg/ --work-tree=$install_folder checkout
/usr/bin/git --git-dir=$install_folder/.cfg/ --work-tree=$install_folder config --local status.showUntrackedFiles no
## Cloning the rest of the config repos
git clone --depth 1 https://github.com/Juanito87/.shell_config.git
git clone --depth 1 https://github.com/Juanito87/.prompt.git
git clone --depth 1 https://github.com/Juanito87/.tmux.git
cd .tmux
git submodule init
git submodule update
cd ..
git clone --depth 1 https://github.com/Juanito87/.vim.git
cd .vim
git submodule init
git submodule update
cd ..
## Setting helptags for vim plugins
cd .vim/pack
vim -u NONE -c "helptags dist/start/pormpt-airline.vim/doc" -c q
vim -u NONE -c "helptags dist/start/vim-airline/doc" -c q
vim -u NONE -c "helptags dracula/doc" -c q
vim -u NONE -c "helptags fzf/doc" -c q
vim -u NONE -c "helptags gruvbox/doc" -c q
vim -u NONE -c "helptags tmuxline.vim/doc" -c q
vim -u NONE -c "helptags vim-tmux/doc" -c q
vim -u NONE -c "helptags fugitive/doc" -c q
vim -u NONE -c "helptags commentary/doc" -c q
vim -u NONE -c "helptags fugitive/doc" -c q
vim -u NONE -c "helptags surround/doc" -c q
vim -u NONE -c "helptags vim-syntastic/doc" -c q

if [ $synergy == "false" ]; then
    rm .synergy.conf
fi

# Sourcing config
source $install_folder/.bashrc

echo "You should see the new prompt now"
