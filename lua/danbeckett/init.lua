print("you'll think of something")

require("danbeckett.remaps")
require("danbeckett.sets")
require("danbeckett.lspconfig")

vim.api.nvim_create_user_command('Cfempty', function()
  vim.fn.setqflist({}, 'r')
end, {})
