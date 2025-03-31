# Transparent.nvim

Transparent.nvim is a Neovim plugin designed to make your Neovim interface transparent by removing background colors from highlight groups. This plugin is highly customizable, allowing users to specify which highlight groups should be affected.

## Features

- Remove background colors from specified highlight groups.
- Preserve other highlight attributes such as foreground color and styles.
- Easy to configure and extend.

## Installation

### Using [lazy.nvim](https://github.com/folke/lazy.nvim)

Create a plugin file and add:

```lua
use {
  'hotuansang96/transparent.nvim',
  name = "transparent",
  config = function()
    require('transparent').setup({
      prefixes = {'Normal', 'Comment', 'Constant'} -- Example prefixes
    })
  end
}

