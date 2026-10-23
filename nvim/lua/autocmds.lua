require "nvchad.autocmds"

local autoread_group = vim.api.nvim_create_augroup("AutoReadExternalChanges", { clear = true })

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  group = autoread_group,
  callback = function(args)
    local buf = args.buf
    if vim.bo[buf].modified or vim.bo[buf].buftype ~= "" or vim.api.nvim_buf_get_name(buf) == "" then
      return
    end

    vim.cmd("checktime " .. buf)
  end,
})
