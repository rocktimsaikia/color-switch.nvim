# color-switch.nvim

Easily convert and switch between different color formats.

> [!NOTE]
> Currently, it supports switching between HEX and RGB color formats only. \
> More will be supported soon. As most engineers primarily deal \
> with these two formats only, they are enabled by default.

## Installation

Using [packer](https://github.com/wbthomason/packer.nvim) here:

```lua
use {
    "rocktimsaikia/color-switch.nvim",
    config = function()
        require("color-switch")
    end
}
```

## Usage

The plugin exposes a single command `:ColorSwitch` to keep the API simple and easy to use. \
Combine it with your preferred key mapping in normal mode.

Example:

```lua
vim.keymap.set("n", "<Leader>cs", ":ColorSwitch<CR>")
```
