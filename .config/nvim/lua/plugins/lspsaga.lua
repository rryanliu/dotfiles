return {
    "nvimdev/lspsaga.nvim",
    config = function()
        require("lspsaga").setup({})
    end,
    dependencies = { "nvim-lspconfig", "nvim-treesitter", "nvim-web-devicons" },
}
