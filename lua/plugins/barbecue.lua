return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    event = "VeryLazy",
    opts = {
        --Whether to attach navic to language servers automatically. boolean
        attach_navic = true,
        --Whether to create winbar updater autocmd. boolean
        create_autocmd = true,
        --Buftypes to enable winbar in. string[]
        include_buftypes = { "" },
        --Filetypes not to enable winbar in. string[]
        exclude_filetypes = { "netrw", "toggleterm" },
        modifiers = {
            --Filename modifiers applied to dirname.
            --See: `:help filename-modifiers`. string
            dirname = ":~:.",
            --Filename modifiers applied to basename.
            --See: `:help filename-modifiers` string
            basename = "",
        },
        --Whether to display path to file. boolean
        show_dirname = false,
        --Whether to display file name. boolean
        show_basename = false,
        --Whether to replace file icon with the modified symbol when buffer is
        --modified. boolean
        show_modified = false,
        --Get modified status of file. fun(bufnr: number): boolean
        modified = function(bufnr)
            return vim.bo[bufnr].modified
        end,
        ---Whether to show/use navic in the winbar. boolean
        show_navic = true,
        ---Get leading custom section contents.
        lead_custom_section = function()
            return " "
        end,
        ---Get custom section contents.
        custom_section = function()
            return " "
        end,
        ---Theme to be used for generating highlight groups dynamically.
        theme = "auto",
        ---Whether context text should follow its icon's color.
        context_follow_icon_color = true,
        symbols = {
            ---Modification indicator.
            modified = "●",
            ---Truncation indicator.
            ellipsis = "…",
            ---Entry separator.
            separator = "",
        },
        kinds = {
            File = "",
            Module = "",
            Namespace = "󰦮",
            Package = "",
            Class = "",
            Method = "󰊕",
            Property = "",
            Field = "",
            Constructor = "",
            Enum = "",
            Interface = "",
            Function = "󰊕",
            Variable = "󰀫",
            Constant = "󰏿",
            String = "",
            Number = "󰎠",
            Boolean = "󰨙",
            Array = "",
            Object = "",
            Key = "",
            Null = "",
            EnumMember = "",
            Struct = "󰆼",
            Event = "",
            Operator = "",
            TypeParameter = "",
        },
    },
}
