local vim = vim

-- Configure diagnostics and windows
-- These have to configured before plugins and tools hook into them
vim.diagnostic.config({
  signs = true,
  underline = true,
  update_in_insert = false,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
  },
  virtual_text = {
    spacing = 4,
    source = "if_many",
    prefix = "●",
  },
  severity_sort = true,
})

