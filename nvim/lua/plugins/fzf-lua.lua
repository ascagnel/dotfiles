return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  opts = {},
  keys = {
	{ "<C-p>", "<cmd>FzfLua global<cr>", desc = "Global search" },
    { "<C-b>", "<cmd>FzfLua buffers<cr>" },
    { "gd", "<cmd>FzfLua lsp_definitions<cr>", desc = "Go to definition" },
    { "gr", "<cmd>FzfLua lsp_references<cr>", desc = "Go to references" },
    { "gc", "<cmd>FzfLua continue<cr>", desc = "Continue previous search" },
  },
}
