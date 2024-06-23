# Introduction

This is my vim configuration

# Requirements

- Vim with `terminal` feature
- Vim with `python` feature
- [Nerd Fonts](https://www.nerdfonts.com/) (for vim icons)

# Installation

```bash
cd ~
git clone git@github.com:Lesords/vim-config.git ~/.vim
```

# Keymaps

## General

| Mode   | Shortcut Keys | Action         |
| ------ | ------------- | -------------- |
| Normal | Alt + h       | Go to left window |
| Normal | Alt + j       | Go to downer window |
| Normal | Alt + k       | Go to upper window |
| Normal | Alt + l       | Go to right window |
| Terminal | Alt + h       | Go to left window |
| Terminal | Alt + j       | Go to downer window |
| Terminal | Alt + k       | Go to upper window |
| Terminal | Alt + l       | Go to right window |
| Normal | gp            | Return to the previous file |
| Normal | Ctrl + s      | Save file |
| Normal | Ctrl + q      | Quit     |
| Normal | Alt + s      | Save file |
| Normal | Alt + q      | Quit       |
| Normal | Tab           | Switch to next tab |
| Normal | Backspace | Switch to the previous tab |
| Normal | T | New Tab |
| Normal | ,\* | Count the number of occurrences of the current field |
| Normal | ,c | Toggle conceal level |
| Normal | Alt + t | Return to the original path |
| Normal | Alt + i | Switch line style |
| Normal | ,lg    | Open lazygit |
| Normal | Alt + m    | Open Fern |
| Normal | Alt + p   | Open UndoTree |
| Normal | Alt + n   | Open Vista |
| Normal | Alt + o   | Open Floaterm |

## Fern

| Shortcut Keys | Action         |
| ------------- | -------------- |
| o      | Toggle Folder |
| h      | Close Folder |
| l      | Expand folder (open file) |
| !     | Show (disable) hidden files |
| N     | create a new file |
| t     | Open in a new tab |
| T     | Open in a new tab (background) |
| i     | Open the file in the upper window |
| gi    | Open the file in the upper window (background) |
| s     | Open the file in the left window |
| gs    | Open the file in the left window (background) |
| <     | Go to the previous directory |
| >      | Enter the current directory |
| BackSpace     | Go to the previous directory |
| Enter      | Enter the current directory |
| r     | Reload the file |
| cd    | Modify the current path |

## EasyMotion

| Shortcut Keys | Action         |
| ------------- | -------------- |
| s    | Position jump (two characters) |
| ,/    | Location jump (text search) |
| ,j    | Jump up |
| ,k    | Jump down |

## Multiple Cursors

| Shortcut Keys | Action         |
| ------------- | -------------- |
| Ctrl + n    | Start selecting the (next) text |
| Ctrl + p    | Return to previous text |
| Ctrl + x    | Skip current text |
| Ctrl + j    | Exit MultiCursor Mode |

## Signify

| Mode   | Shortcut Keys | Action         |
| ------ | ------------- | -------------- |
| Normal | Alt + d       | Toggle Signify |
| Normal | ,gd       | Create a new tab to compare changes |
| Normal | ,gp       | Use a float window to compare changes |
| Normal | ,gu       | Restore the contents of the current line |
| Normal | ,gj       | Jump to the last modified location |
| Normal | ,gk       | Jump to the next modified position |
| Operation | ic       | Cover modification range |
| Operation | ac       | Cover modification range |
| Visual | ic       | Cover modification range |
| Visual | ac       | Cover modification range |

## Tabularize

| Mode   | Shortcut Keys | Action         |
| ------ | ------------- | -------------- |
| Normal | ,a=    | Align text according to = |
| Normal | ,a:    | Align text according to : |
| Visual | ,a=    | Align text according to = |
| Visual | ,a:    | Align text according to : |

## LeaderF

| Mode   | Shortcut Keys | Action         |
| ------ | ------------- | -------------- |
| Normal | ,ff       | Search for files |
| Normal | ,fb       | Search Cache |
| Normal | ,fm       | Search History |
| Normal | ,fl       | Search Line |
| Normal | ,fa       | Search the current field（In all caches） |
| Normal | ,fc       | Search the current field（c/cpp related files only） |
| Normal | ,fs       | Search (input required) |
| Normal | Alt + f       | Search the current field |
| Visual | gf       | Search the current field |
| Normal | go       | Execute the last search operation again |
| Normal | ,fg       | Generate gtag files |
| Normal | ,fr       | Jump to reference |
| Normal | ,fd      | Jump to definition |
| Normal | ,fo      | Execute the jump operation again |
| Normal | ,fn      | Jump to the next matching result |
| Normal | ,fp      | Jump to the previous matching result |

## Floaterm

| Mode   | Shortcut Keys | Action         |
| ------ | ------------- | -------------- |
| Normal | F7       | Create a new terminal |
| Normal | F8       | Switch to the previous terminal |
| Normal | F9       | Switch to the next terminal |
| Normal | F12       | Toggle Terminal |

# Screenshots

![vim](https://raw.githubusercontent.com/Lesords/ImageHost/main/Repository/vim-config/vim.png)

![vim-Leaderf](https://raw.githubusercontent.com/Lesords/ImageHost/main/Repository/vim-config/vim-Leaderf.png)

![vim-floaterm-vifm](https://raw.githubusercontent.com/Lesords/ImageHost/main/Repository/vim-config/vim-floaterm-vifm.png)
