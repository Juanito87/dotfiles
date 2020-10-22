# To do

- Add check for remote config folder, if exist source it, of not source normal route
- Evaluate adding dependencies to the installer
- Move installer to a gist, so the readme can have a one liner to call
- Try to define dependencies that can be installed vendor agnostic, from the ones that not

# Dot files configuration

This repo will hold the installer of the dot files, and the proxy files that will point to the actual config.
Will also hold config files that don't have huge changes or haven't sort yet. (like synergy.conf)
Each config will be on a different repo, this will allow:

- Use vim fugitive in all the repos with actual configurations (except the bare repo with the references)
- Sort the problem of having a full repo in $HOME
- Avoid showing git branch/status on $HOME
- Showing git branch/status in the rest of the configs created
- Avoid using an alias for most of the config (git instead of gitdot)
- Submodules for the rest of the configurations will work aswell

# Dependencies

- gvim
- powerline
- git
- shellcheck
- php
  - php-pear
    - PHP_CodeSniffer
- npm
  - jsonlint
  - dockerfile_lint
  - js-yaml
- ripgrep 
- zstd
- gzip
- unzip
- bzip2
- fzf

## About the dotfiles

For themes I use gruvbox and dracula, these are vim themes.
I use vim plugins to use those themes in my status line, bash prompt and tmux status to get a more homogeneous setup.
Local config uses gruvbox.
Remote config uses dracula.

Plugins are installed as submodules in the corresponding repo, which makes maintenance easier.

Tmux and vim navigation of panes is set to hjkl (prefix and leader respectively).
Tmux and vim resizing of panes is set to HJKL (prefix and leader respectively).

All configurations are grouped to allow a better portability and migration.
Feel free to use anything you may found useful in here.
Remote installation should isntall everything in a folder that is set in the installer script as $cf.
Then configuration files call the remote config files when connecting over ssh.
This will work in shared environments, and it's easier to cleanup.
