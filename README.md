## README
Use `redguardtoo`'s emacs.d (https://github.com/redguardtoo/emacs.d)

### Usage

```terminal
cd ~ && rm -rf ~/.emacs.d
git clone https://github.com/redguardtoo/emacs.d.git .emacs.d

# install nord-theme
mkdir -p ~/.emacs.d/themes && \
  cd ~/.emacs.d/themes && \
  curl -OL https://raw.githubusercontent.com/arcticicestudio/nord-emacs/master/nord-theme.el

# load theme on startup
echo "(add-to-list 'custom-theme-load-path (expand-file-name \"~/.emacs.d/themes/\"))" >> ~/.emacs.d/init.el
echo "(load-theme 'nord t)" >> ~/.emacs.d/init.el

```

### Links

1. <https://github.com/redguardtoo/mastering-emacs-in-one-year-guide>
