# Dot files configuration

This repo will hold the installer of the dot files, and the proxy files that will point to the actual config.
Will also hold config files that don't have huge changes or haven't sort yet. (like synergy.conf)
Each config will be on a different repo, this will allow:

- Use vim fugitive in all the repos with actual configurations (except the bare repo with the references)
- Sort the problem of having a full repo in $HOME
- Avoid showing git branch on $HOME
- Showing git branch in the rest of the configs created
- Avoid using an alias for most of the config (git instead of gitdot)
- Submodules for the rest of the configurations will work aswell

## About the dotfiles
For themes I use gruvbox and dracula, these are vim themes.i
I use vim plugins to use those themes in my status line, bash prompt and tmux status to get a more homogeneous setup.
Local config uses gruvbox.
Remote config uses dracula.

Plugins are installed as submodules in the corresponding repo, which makes maintenance easier.

Tmux and vim navigation of panes is set to hjkl (prefix and leader respectively).
Tmux and vim resizing of panes is set to HJKL (prefix and leader respectively).

All configurations are grouped to allow a better portability and migration.
Feel free to use anything you may found useful in here.
