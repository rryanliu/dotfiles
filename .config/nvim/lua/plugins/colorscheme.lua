return {
    "bluz71/vim-moonfly-colors",
    name = "moonfly",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd([[colorscheme moonfly]])
        vim.api.nvim_set_hl(0, "CursorLine", {
            bg = "#2f2f2f", -- your new CursorLine bg
            fg = nil, -- keep fg as-is
        })

        vim.api.nvim_set_hl(0, "Visual", {
            bg = "#cf87e8", -- your new Visual bg
            fg = "#323437",
            bold = true, -- optional
        })
    end,
}
