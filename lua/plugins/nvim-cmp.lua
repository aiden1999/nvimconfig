return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-emoji",
        "chrisgrieser/cmp-nerdfont",
        "kdheepak/cmp-latex-symbols",
        "micangl/cmp-vimtex",
        "chrisgrieser/cmp_yanky",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
        table.insert(opts.sources, { name = "emoji" })
        table.insert(opts.sources, { name = "nerdfont" })
        table.insert(opts.sources, { name = "latex_symbols" })
        table.insert(opts.sources, { name = "vimtex" })
        table.insert(opts.sources, { name = "cmp_yanky" })
    end,
}
