-- this is a test colorscheme for brandon
vim.g.theprimeagen_colorscheme = "tokyonight-night"
-- vim.g.theprimeagen_colorscheme = "gruvbox"
-- vim.g.theprimeagen_colorscheme = "onedark"
-- vim.g.theprimeagen_colorscheme = "onehalflight"


function ColorMyPencils()

    vim.g.tokyonight_transparent_sidebar = true
    vim.g.tokyonight_transparent = true

    vim.g.gruvbox_contrast_dark = 'hard'
    vim.g.gruvbox_invert_selection = '0'
    vim.opt.background = "dark"

    vim.cmd("colorscheme " .. vim.g.theprimeagen_colorscheme)

    local hl = function(thing, opts)
        vim.api.nvim_set_hl(0, thing, opts)
    end

    --disables left column bg
    hl("SignColumn", {
        bg = "none",
    })

    hl("ColorColumn", {
        ctermbg = 0,
        bg = "#555555",
    })

    hl("CursorLineNR", {
        bg = "None"
    })

    hl("Normal", {
      bg = "None"
    })

    hl("LineNr", {
        fg = "#5eacd3"
    })

    hl("netrwDir", {
        fg = "#5eacd3"
    })

end
ColorMyPencils()
