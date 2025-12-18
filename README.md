# Introduction

This is my vim configuration

# Requirements

- Vim with `terminal` feature
- Vim with `python` feature
- Vim with `clipboard` feature, vim-gtk3 package is required (optional)
- [Nerd Fonts](https://www.nerdfonts.com/) (for vim icons)

# Installation

```bash
cd ~
git clone git@github.com:Lesords/vim-config.git ~/.vim --depth 1 --recurse-submodules --shallow-submodules
# Or
git clone https://github.com/Lesords/vim-config.git ~/.vim --depth 1 --recurse-submodules --shallow-submodules
```

Or

```bash
cd ~
git clone git@github.com:Lesords/vim-config.git ~/.vim --depth=1
# Or
git clone https://github.com/Lesords/vim-config.git ~/.vim --depth=1

git submodule update --init --recursive --depth 1
```

Note: To use these configuration files in GVim, you need to add the following to the `_vimrc` file

```bash
set runtimepath+=$HOME/.vim
source $HOME/.vim/vimrc
```

# Keymaps

## General

| Mode   | Shortcut Keys | Action         |
| ------ | ------------- | -------------- |
| Normal | Alt + h       | Go to left window   |
| Normal | Alt + j       | Go to downer window |
| Normal | Alt + k       | Go to upper window  |
| Normal | Alt + l       | Go to right window  |
| Terminal | Alt + h     | Go to left window   |
| Terminal | Alt + j     | Go to downer window |
| Terminal | Alt + k     | Go to upper window  |
| Terminal | Alt + l     | Go to right window  |
| Normal | gp            | Return to the previous file |
| Normal | Ctrl + s      | Save file           |
| Normal | Ctrl + q      | Quit                |
| Normal | Alt + s       | Save file           |
| Normal | Alt + q       | Quit                |
| Normal | Backspace     | Switch to the next tab |
| Normal | Alt + BS      | Switch to the previous tab |
| Normal | T             | New Tab             |
| Normal | ,m            | Toggle full screen  |
| Normal | ,\*           | Count the number of occurrences of the current field |
| Normal | ,c            | Toggle conceal level |
| Normal | Alt + t       | Return to the original path |
| Normal | Alt + i       | Switch line style   |
| Normal | ,i            | Switch indent size  |
| Normal | ,t            | Switch between tab and space |
| Normal | ,lg           | Open lazygit        |
| Normal | Alt + m       | Open Fern           |
| Normal | Alt + p       | Open UndoTree       |
| Normal | Alt + n       | Open Vista          |
| Normal | Alt + o       | Open Floaterm       |

**Git Bash only**

| Mode   | Shortcut Keys | Action         |
| ------ | ------------- | -------------- |
| Normal | ,o            | Open the current file with the system default tool |
| Normal | ,e            | Open the current path with a file manager |

**GVim only**

| Mode   | Shortcut Keys | Action         |
| ------ | ------------- | -------------- |
| Visual | ,y            | Copy content to the system clipboard    |
| Normal | ,p            | Paste content from the system clipboard |

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

## Expand Region

| Shortcut Keys | Action         |
| ------------- | -------------- |
| +    | expand the visual selection |
| -    | shrink the visual selection |

## EasyMotion

| Shortcut Keys | Action         |
| ------------- | -------------- |
| s    | Position jump (two characters) |
| ,/    | Location jump (text search) |
| ,j    | Jump up |
| ,k    | Jump down |

## Visual Multi

| Mode          | Shortcut Keys | Action         |
| ------------- | ------------- | -------------- |
| Normal        | Ctrl + n      | Start selecting the (next) text |
| Normal        | i, a, I, A    | Start insert mode               |
| Visual-Multi  | Esc	        | Exit Visual Multi Mode          |
| Visual-Multi  | n	            | find next (same as C-n)         |
| Visual-Multi  | N	            | find previous                   |
| Visual-Multi  | ]	            | goto next                       |
| Visual-Multi  | [	            | goto previous                   |
| Visual-Multi  | q	            | skip and go to next             |
| Visual-Multi  | Q	            | remove region                   |
| Visual-Multi  | C-f	        | fast forward (go to first region in next page)      |
| Visual-Multi  | C-b	        | fast backward (go to first region in previous page) |

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

## Context

| Mode   | Shortcut Keys | Action                |
| ------ | ------------- | --------------------- |
| Normal | ,[            | Toggle Context Window |

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

## Clang Format

| Mode   | Shortcut Keys | Action         |
| ------ | ------------- | -------------- |
| Normal | Ctrl + m      | Format all code |
| Visual | Ctrl + m      | Format the currently selected code |

## Code Motion

| Mode   | Shortcut Keys | Action         |
| ------ | ------------- | -------------- |
| Normal | Alt + J       | Move code down |
| Normal | Alt + K       | Move code up   |
| INSERT | Alt + J       | Move code down |
| INSERT | Alt + K       | Move code up   |
| Visual | Alt + J       | Move code down |
| Visual | Alt + K       | Move code up   |

## scope

| Mode   | Shortcut Keys | Action         |
| ------ | ------------- | -------------- |
| Normal | <Space> + ff  | Search for files |
| Normal | <Space> + fs  | Search (rg) |

## fuzzbox

| Mode   | Shortcut Keys | Action         |
| ------ | ------------- | -------------- |
| Normal | <Space> + fz  | Search for files |
| Normal | <Space> + fl  | Search Line |

## CopilotChat

| Mode   | Shortcut Keys | Action         |
| ------ | ------------- | -------------- |
| Normal | <Space> + cc  | Open Copiloat Chat |

# Screenshots

![vim](https://raw.githubusercontent.com/Lesords/ImageHost/main/Repository/vim-config/vim.png)

![vim-Leaderf](https://raw.githubusercontent.com/Lesords/ImageHost/main/Repository/vim-config/vim-Leaderf.png)

![vim-floaterm-vifm](https://raw.githubusercontent.com/Lesords/ImageHost/main/Repository/vim-config/vim-floaterm-vifm.png)
