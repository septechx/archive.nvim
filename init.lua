local M = {}
local util = require 'archive-nvim.util'

local function is_markdown()
  local ft = vim.bo.filetype
  return ft == 'markdown' or vim.fn.expand '%:e' == 'md'
end

local function move_to_archive()
  if not is_markdown() then
    vim.notify('Not a markdown file', vim.log.levels.WARN)
    return
  end

  local current_path = vim.api.nvim_buf_get_name(0)
  if current_path == '' then
    vim.notify('Buffer has no name', vim.log.levels.ERROR)
    return
  end

  local workspace = util.find_project_root()
  local archive_dir = workspace .. '/Archive'
  vim.fn.mkdir(archive_dir, 'p')

  local filename = vim.fn.fnamemodify(current_path, ':t')
  local target_path = archive_dir .. '/' .. filename

  if vim.fn.filereadable(target_path) == 1 then
    vim.notify('File already exists in archive', vim.log.levels.ERROR)
    return
  end

  vim.cmd(string.format([[write! %s]], vim.fn.fnameescape(target_path)))
  vim.cmd [[bdelete]]
  vim.fn.delete(current_path)
  vim.notify('Moved to archive: ' .. target_path, vim.log.levels.INFO)
end

function M.setup()
  vim.keymap.set('n', '<leader>a', move_to_archive, { desc = 'Move markdown file to archive' })
end

return M
