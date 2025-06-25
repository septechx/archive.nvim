local M = {}

function M.find_project_root()
  local path = vim.fn.expand '%:p:h'
  local root_markers = { '.git', '.hg', '.svn', '.obsidian', 'package.json' }
  local uv = vim.loop

  while path ~= '/' do
    for _, marker in ipairs(root_markers) do
      local marker_path = path .. '/' .. marker
      local stat = uv.fs_stat(marker_path)
      if stat then
        return path
      end
    end
    path = vim.fn.fnamemodify(path, ':h')
  end

  return vim.fn.getcwd()
end

return M
