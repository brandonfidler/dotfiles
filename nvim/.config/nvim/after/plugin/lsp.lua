local Remap = require("theprimeagen.keymap")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local sumneko_root_path = "/home/mpaulson/personal/sumneko"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"
local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
  }),
  formatting = {
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[Path]",
        luasnip = "[Snip]",
        nvim_lsp_signature_help = "[Sig]",
      },
    },
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim-lua" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "nvim_lsp_signature_help" },
  },
  experimental = {
    native_menu = false,
  },
})

require 'cmp'.setup.cmdline(':', {
  sources = {
    { name = 'cmdline' }
  }
})
require 'cmp'.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})
require 'cmp'.setup.cmdline('?', {
  sources = {
    { name = 'buffer' }
  }
})


local function config(_config)
  return vim.tbl_deep_extend("force", {
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = function()
      Remap.nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
      Remap.nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
      Remap.nnoremap("<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
      Remap.nnoremap("<leader>vd", ":lua vim.diagnostic.open_float()<CR>")
      Remap.nnoremap("[d", ":lua vim.lsp.diagnostic.goto_next()<CR>")
      Remap.nnoremap("]d", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
      Remap.nnoremap("<leader>vca", ":lua vim.lsp.buf.code_action()<CR>")
      Remap.nnoremap("<leader>vrr", ":lua vim.lsp.buf.references()<CR>")
      Remap.nnoremap("<leader>vrn", ":lua vim.lsp.buf.rename()<CR>")
      Remap.inoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
    end,
  }, _config or {})
end

require("lspconfig").tsserver.setup(config())

require 'lspconfig'.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },

      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

require 'lspconfig'.intelephense.setup {}

capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').cssls.setup(config())

capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.html.setup {
  capabilities = capabilities,
}

capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require 'lspconfig'.jsonls.setup {
  capabilities = capabilities,
}

require 'lspconfig'.tailwindcss.setup {}
require 'lspconfig'.prismals.setup {}
require 'lspconfig'.eslint.setup {}
require 'lspconfig'.cssmodules_ls.setup {}
require 'lspconfig'.solidity_ls.setup {}
require 'lspconfig'.vimls.setup {}
require("lspconfig").ccls.setup(config())

require("luasnip.loaders.from_vscode").lazy_load()
require 'lspconfig'.bashls.setup {}

local nvim_lsp = require 'lspconfig'

local pid = vim.fn.getpid()
local omnisharp_bin = "/Users/brandonfidler/.dotfiles/omnisharp/run"

require 'lspconfig'.omnisharp.setup {
  cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) };
  root_dir = nvim_lsp.util.root_pattern("*.csproj", "*.sln");
}

require 'lspconfig'.rust_analyzer.setup(config({
  cmd = { "rustup", "run", "nightly", "rust-analyzer" },
  settings = {
    rust = {
      unstable_features = true,
      build_on_save = false,
      all_features = true,
    },
  }
}))
