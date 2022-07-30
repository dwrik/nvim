# Neovim Configuration

![Dashboard](./screenshot/neovim.png "Neovim start screen")

This repository contains my configuration for neovim to make it my primary development environment. The goal is to switch entirely to neovim to have a faster, more productive development experience.

## Features

| Feature        | Plugin            |
|:-------------- |:----------------- |
| Statusbar      | lualine           |
| Bufferbar      | bufferline        |
| Fuzzy Finder   | telescope         |
| Comments       | comment           |
| LSP Completion | coc               |
| File Explorer  | nvim-tree         |
| Terminal       | nvterm            |
| Syntax Parser  | nvim-treesitter   |
| Indent Lines   | indent-blankline  |
| Git Indicators | gitsigns          |
| Icons          | nvim-web-devicons |
| Dashboard      | alpha-nvim        |
| Colorscheme    | tokyonight        |
| Plugin Manager | packer            |

## Installation

1. Clone the repo
2. Open `lua/packer_init.nvim` in neovim and save it. This is will automatically download and install all the required plugins.
3. Additionally, install required language servers using `:CocInstall <server name>`. Refer [this](https://github.com/neoclide/coc.nvim/wiki/Language-servers) for a list of available LSP servers.
