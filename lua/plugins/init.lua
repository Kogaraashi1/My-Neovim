-- lua/plugins/init.lua
return {
  -- Plugin de Telescope (buscador)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      -- Configuración básica
      require("telescope").setup()
      
      -- Atajos de teclado (opcional pero útil)
      local map = vim.keymap.set
      map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
    end,
  },
}
