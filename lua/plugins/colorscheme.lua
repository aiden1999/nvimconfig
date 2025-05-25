return {
    {
        "gbprod/nord.nvim",
        config = function()
            require("nord").setup({
                styles = {
                    comments = { italic = true },
                    keywords = { italic = true },
                    variables = { bold = true },
                },
            })
            require("bufferline").setup({
                options = {
                    separator_style = "thin",
                },
                highlights = require("nord.plugins.bufferline").akinsho(),
            })
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "nord",
        },
    },
}
