#!/bin/sh

# Variable for naming the conf folder
cf=".juanito_rc"
action=$1

# shellcheck disable=SC2034
case "$action" in
    ""|l|L )    install_folder="$HOME" && synergy="true" ;;
    r|R )       install_folder="$HOME/$cf" && synergy="false" && mkdir $cf;;
    *)      printError "Invalid option"; exit 1
esac

chown "$(logname)":"$(logname)" -R $install_folder

# Setting git options for vim
git config --global merge.tool vimdiff
git config --global core.excludesfile $install_folder/.gitignore-global

# Cloning public dotfiles
## This dot files will point to different repos with the actual config.
## This will avoid the problems of having $HOME as a full git repo, and treat the directories with configuration files as normal repos.
## The clone process will create a bare repo(--bare), anc get only the latest version (--depth 1).
git clone --bare --depth 1 --branch=v2 https://github.com/Juanito87/dotfiles.git $install_folder/.cfg
cd $install_folder
mkdir -p .config-backup && \
/usr/bin/git --git-dir=$install_folder/.cfg --work-tree=$install_folder checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
rm README.md installer.sh
/usr/bin/git --git-dir=$install_folder/.cfg/ --work-tree=$install_folder checkout
rm $install_folder/.shell_config/README.md
/usr/bin/git --git-dir=$install_folder/.cfg/ --work-tree=$install_folder config --local status.showUntrackedFiles no
## Cloning the rest of the config repos
cd $install_folder
git clone --depth 1 https://github.com/Juanito87/.shell_config.git
rm .shell_config/README.MD
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
vim -c "helptags ALL" -c q


# Cleaning up
if [ $synergy == "false" ]; then
    rm .synergy.conf
fi

# Sourcing config
source $install_folder/.bashrc

# Finishing
echo "You should see the new prompt now"
