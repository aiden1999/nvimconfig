return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        { "kevinhwang91/promise-async" },
        { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    },
    opts = { filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" } },
    event = "BufReadPost",
    config = function()
        vim.o.foldcolumn = "1"
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        require("ufo").setup({
            provider_selector = function(_, _, _)
                return { "treesitter", "indent" }
            end,

            fold_virt_text_handler = function(virtText, lnum, endLnum, width, truncate, ctx)
                local newVirtText = {}
                local suffix = ("  %d"):format(endLnum - lnum)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0

                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if curWidth + chunkWidth < targetWidth then
                        table.insert(newVirtText, chunk)
                        curWidth = curWidth + chunkWidth
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        table.insert(newVirtText, { chunkText, chunk[2] })
                        break
                    end
                end
                table.insert(newVirtText, { suffix, "MoreMsg" })
                return newVirtText
            end,
        })
    end,
}
