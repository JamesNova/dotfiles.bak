local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.del('n', 'e', { buffer = bufnr })
  vim.keymap.del('n', 'm', { buffer = bufnr })

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
  vim.keymap.set('n', 'm', 'h')
  vim.keymap.set('n', 'n', 'j')
  vim.keymap.set('n', 'e', 'k')
  vim.keymap.set('n', 'i', 'l')
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
  ---
}
