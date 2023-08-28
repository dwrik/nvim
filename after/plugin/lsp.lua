local lsp = require('lsp-zero').preset({
    -- see :help nvim_win_open() for possible border values
    float_border = 'solid',
})

lsp.on_attach(function(client, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({
        buffer = bufnr,
        omit = { 'gr' }, -- omit setting the following bindings
    })
end)

-- TODO install the following language servers manually by running :mason
-- and manually selecting the language servers, formatters, linters etc.
-- languages:  c, cpp, lua, javascript, html, vim, vimdoc

-- configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- use icons in sign column
lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
})

-- lsp zero setup call
lsp.setup()

-- you need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

-- lspkind for icons
local lspkind = require('lspkind')

cmp.setup({
    -- sort completion items such that matches are placed near cursor
    view = {
        entries = { name = 'custom', selection_order = 'near_cursor' }
    },
    mapping = {
        -- enter key to confirm completion, set select to true to insert first item even if not selected
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        -- ctrl+j/k to navigate next/prev based on completion list direction
        ['<C-j>'] = function(fallback)
            if cmp.visible() then
                if cmp.core.view.custom_entries_view:is_direction_top_down() then
                    cmp.select_next_item()
                else
                    cmp.select_prev_item()
                end
            else
                fallback()
            end
        end,
        ['<C-k>'] = function(fallback)
            if cmp.visible() then
                if cmp.core.view.custom_entries_view:is_direction_top_down() then
                    cmp.select_prev_item()
                else
                    cmp.select_next_item()
                end
            else
                fallback()
            end
        end,

        -- ctrl+space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- navigate between snippet placeholder
        ['<Tab>'] = cmp_action.luasnip_jump_forward(),
        ['<S-Tab>'] = cmp_action.luasnip_jump_backward(),
    },
    formatting = {
        fields = {
            cmp.ItemField.Abbr, -- text
            cmp.ItemField.Kind, -- icon & icon type
            cmp.ItemField.Menu, -- completion source
        },
        format = lspkind.cmp_format({
            mode = 'symbol_text',  -- show only symbol annotations
            maxwidth = 50,         -- prevent the popup from showing more than provided characters
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char
            menu = ({
                buffer = '[Buffer]',
                nvim_lsp = '[LSP]',
                luasnip = '[LuaSnip]',
                nvim_lua = '[Lua]',
                latex_symbols = '[Latex]',
            })
        })
    },
})
