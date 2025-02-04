local o = vim.o
local vim = vim

o.title = true
o.termguicolors = false
o.scrolloff = 5
o.showmatch = true
o.matchtime = 2
o.wrap = true
o.linebreak = true
o.breakindent = true 
o.cursorline = false 
o.number = true
o.relativenumber = true
o.clipboard = 'unnamed'
o.hlsearch = false 
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.expandtab = true
o.errorbells = false
o.swapfile = false 
o.updatetime = 250


-- Netrw
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.keymap.set("n", "t", ":NvimTreeToggle<CR>", { noremap = true })
local function nvim_tree_on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set("n", ".", api.tree.change_root_to_node, opts("Root"))
    vim.keymap.set("n", "<backspace>", api.tree.change_root_to_parent, opts("Up"))
    vim.keymap.set("n", "w", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "s", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "v", api.node.open.vertical, opts("Open vertical"))
    vim.keymap.set("n", "h", api.node.open.horizontal, opts("Open horizontal"))
end

require("nvim-tree").setup({
    on_attach = nvim_tree_on_attach,
    disable_netrw = true,
    sync_root_with_cwd = false,
    modified = { enable = true },
    actions = {
        change_dir = {
            global = true,
        },
        open_file = {
            window_picker = {
                enable = false,
            },
        },
    },
    update_focused_file = {
        enable = true,
        update_root = false,
        ignore_list = {},
    },
    view = {
        signcolumn = "yes",
        width = "20%",
    },
    renderer = {
        indent_width = 2,
        indent_markers = {
            enable = true,
            inline_arrows = false,
            icons = {
                corner = "|",
                edge = "|",
                item = "|",
                bottom = " ",
                none = "|",
            },
        },
        icons = {
            web_devicons = {
                file = {
                    enable = false,
                    color = false,
                },
                folder = {
                    enable = false, 
                    color = false,
                },
            },
            padding = " ",
            symlink_arrow = " → ",
            show = {
                file = false,
                folder = false,
                folder_arrow = false,
                git = false,
                modified = true,
                diagnostics = false,
                bookmarks = false,
            },
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "",
                modified = "+",

                folder = {
                    arrow_closed = "▸",
                    arrow_open = "▾",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
            },
        },
    },
    git = {
        enable = false,
    },
    filters = {
        git_ignored = false,
        dotfiles = false,
        git_clean = false,
        no_buffer = false,
        no_bookmark = false,
        custom = {},
        exclude = {},
    },
})


require("focus").setup({
    enable = true, -- Enable module
    commands = true, -- Create Focus commands
    autoresize = {
        enable = true, -- Enable or disable auto-resizing of splits
        width = 0, -- Force width for the focused window
        height = 0, -- Force height for the focused window
        minwidth = 0, -- Force minimum width for the unfocused window
        minheight = 0, -- Force minimum height for the unfocused window
        height_quickfix = 10, -- Set the height of quickfix panel
    },
    split = {
        bufnew = false, -- Create blank buffer for new split windows
        tmux = false, -- Create tmux splits instead of neovim splits
    },
    ui = {
        number = false, -- Display line numbers in the focussed window only
        relativenumber = false, -- Display relative line numbers in the focussed window only
        hybridnumber = false, -- Display hybrid line numbers in the focussed window only
        absolutenumber_unfocussed = false, -- Preserve absolute numbers in the unfocussed windows

        cursorline = true, -- Display a cursorline in the focussed window only
        cursorcolumn = false, -- Display cursorcolumn in the focussed window only
        colorcolumn = {
            enable = false, -- Display colorcolumn in the foccused window only
            list = '+1', -- Set the comma-saperated list for the colorcolumn
        },
        signcolumn = true, -- Display signcolumn in the focussed window only
        winhighlight = false, -- Auto highlighting for focussed/unfocussed windows
    }
})


