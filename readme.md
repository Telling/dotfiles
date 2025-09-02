#### These are my dotfiles, nicely stowed.

This is what I do:

0. Install `stow`.

Then:

1. clone to `~/`.
2. `cd ~/dotfiles`
3. `stow bash`
4. `stow vim`
5. `stow git`
    - Add `export GIT_COMITTER_NAME` and `export GIT_COMITTER_EMAIL` in `~/.git_secrets`
    - Add `export GIT_CONFIG_COUNT="1"`, `export GIT_CONFIG_KEY_0="user.signingKey"` and `export GIT_CONFIG_VALUE_0="PATH_TO_SIGNING_SSH_KEY"` in `~/.git_secrets`
6. `stow tmux`
7. `stow scripts`
