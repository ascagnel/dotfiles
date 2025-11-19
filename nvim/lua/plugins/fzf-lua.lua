return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  opts = {},
  keys = {
	{
        "<C-p>", 
        function ()
            require('fzf-lua').global()
        end,
        desc = "Global search"
    },
    {
        "<C-b>",
        function ()
            require('fzf-lua').buffers()
        end,
        desc = "Buffer search",
    },
    {
        "gd",
        function ()
            require('fzf-lua').lsp_definitions()
        end,
        desc = "Go to definition"
    },
    {
        "gr",
        function ()
            require('fzf-lua').lsp_references()
        end,
        desc = "Go to references"
    },
  },
}
