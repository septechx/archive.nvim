# archive.nvim

A Neovim plugin for easily archiving markdown files by moving them to a dedicated Archive directory within your project.

## Installation

### Using lazy.nvim

Add this to your Neovim configuration:

```lua
{
  'septechx/archive.nvim',
  lazy = true,
  ft = 'markdown',
  config = function()
    require('archive-nvim').setup()
  end,
}
```

### Manual Installation

1. Clone or download the plugin to your Neovim plugins directory
2. Add to your `init.lua`:

```lua
require('archive-nvim').setup()
```

## Usage

### Default Keybinding

- `<leader>a` - Move the current markdown file to the project's Archive directory

## Configuration

The plugin is designed to work out of the box with sensible defaults. The setup function accepts an optional boolean parameter to control automatic keymap setup:

```lua
-- Automatic keymap setup (default behavior)
require('archive-nvim').setup()
```

### Custom Keybinding

If you want to use a different keybinding, you can disable automatic setup and set your own:

```lua
-- Disable automatic keymap setup
require('archive-nvim').setup(false)

-- Set your own keybinding
vim.keymap.set('n', '<leader>ar', function()
  require('archive-nvim').move_to_archive()
end, { desc = 'Archive markdown file' })
```

## Requirements

- Neovim 0.8.0 or higher


## License

This project is licensed under the MIT License
