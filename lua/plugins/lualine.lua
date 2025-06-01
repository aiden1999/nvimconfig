return {
    "nvim-lualine/lualine.nvim",
    opts = function()
        local lualine_require = require("lualine_require")
        lualine_require.require = require
        local icons = LazyVim.config.icons
        vim.o.laststatus = vim.g.lualine_laststatus
        local opts = {
            options = {
                theme = "nord",
                globalstatus = vim.o.laststatus == 3,
                disabled_filetypes = {
                    statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard", "snacks_terminal" },
                },
            },
            sections = {
                lualine_a = {
                    { "mode", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
                },
                lualine_b = {
                    "branch",
                    {
                        "diff",
                        symbols = {
                            added = icons.git.added,
                            modified = icons.git.modified,
                            removed = icons.git.removed,
                        },
                        source = function()
                            local gitsigns = vim.b.gitsigns_status_dict
                            if gitsigns then
                                return {
                                    added = gitsigns.added,
                                    modified = gitsigns.changed,
                                    removed = gitsigns.removed,
                                }
                            end
                        end,
                    },
                },
                lualine_c = {},
                lualine_x = {
                    {
                        "diagnostics",
                        symbols = {
                            error = icons.diagnostics.Error,
                            warn = icons.diagnostics.Warn,
                            info = icons.diagnostics.Info,
                            hint = icons.diagnostics.Hint,
                        },
                    },
                    "encoding",
                    "fileformat",
                    "filetype",
                },
                lualine_y = {
                    { "progress", separator = " ", padding = { left = 1, right = 1 } },
                },
                lualine_z = {
                    {
                        "location",
                        separator = { right = "", left = "" },
                    },
                },
            },
            extensions = { "neo-tree", "lazy", "fzf" },
        }
        if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
            local trouble = require("trouble")
            local symbols = trouble.statusline({
                mode = "symbols",
                groups = {},
                title = false,
                filter = { range = true },
                format = "{kind_icon}{symbol.name:Normal}",
                hl_group = "lualine_c_normal",
            })
            table.insert(opts.sections.lualine_c, {
                symbols and symbols.get,
                cond = function()
                    return vim.b.trouble_lualine ~= false and symbols.has()
                end,
            })
        end

        return opts
    end,
}
