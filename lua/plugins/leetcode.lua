return {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
        "folke/snacks.nvim", -- picker
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
    },
    opts = {
        ---@type lc.lang
        lang = "python3",
        ---@type boolean
        image_support = true,
    },
    require("image").setup(),
}
