return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
        workspaces = {
            {
                name = "personal",
                path = "~/repos/obsidian-backup/",
            },
        },
        completion = {
            blink = true,
            min_chars = 2,
            create_new = true,
        },
        new_notes_location = "notes_subdir",
        preferred_link_style = "markdown",
        disable_frontmatter = false,
        picker = {
            name = "snacks.pick",
        },
        sort_by = "modified",
        sort_reversed = true,
        search_max_lines = 1000,
        open_notes_in = "current",
        ui = {
            enable = true, -- set to false to disable all additional syntax features
            ignore_conceal_warn = false, -- set to true to disable conceallevel specific warning
            update_debounce = 200, -- update delay after a text change (in milliseconds)
            max_file_length = 5000, -- disable UI features for files with more than this many lines
            checkboxes = {
                [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                ["x"] = { char = "", hl_group = "ObsidianDone" },
                [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                ["!"] = { char = "", hl_group = "ObsidianImportant" },
            },
            bullets = { char = "•", hl_group = "ObsidianBullet" },
            external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
            reference_text = { hl_group = "ObsidianRefText" },
            highlight_text = { hl_group = "ObsidianHighlightText" },
            tags = { hl_group = "ObsidianTag" },
            block_ids = { hl_group = "ObsidianBlockID" },
            hl_groups = {
                ObsidianTodo = { bold = true, fg = "#d08870" },
                ObsidianDone = { bold = true, fg = "#88c0d0" },
                ObsidianRightArrow = { bold = true, fg = "#d08870" },
                ObsidianTilde = { bold = true, fg = "#d08870" },
                ObsidianImportant = { bold = true, fg = "#bf616a" },
                ObsidianBullet = { bold = true, fg = "#88c0d0" },
                ObsidianRefText = { underline = true, fg = "#b48ead" },
                ObsidianExtLinkIcon = { fg = "#b48ead" },
                ObsidianTag = { italic = true, fg = "#88c0d0" },
                ObsidianBlockID = { italic = true, fg = "#88c0d0" },
                ObsidianHighlightText = { bg = "#ebcb8b" },
            },
        },
    },
}
