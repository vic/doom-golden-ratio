# doom-golden-ratio
Golden-ratio.el-inspired script for doom-emacs.

After trying both golden-ratio.el and zoom.el, both of which break in one way or another, I decided to write my own little script that uses doom-emacs facilities such as doom-switch-window-hook and evil.

## How to use
In .doom.d/packages.el:

   (package! doom-golden-ratio :recipe (:host github :repo "paulalesius/doom-golden-ratio"))

In .doom.d/config.el:

    (after! doom-golden-ratio
        (doom-golden-ratio-mode))

