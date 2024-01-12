local Remap = require("theprimeagen.keymap")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local cmp = require("cmp")
local lspkind = require("lspkind")

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

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
      },
    },
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim-lua" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }
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
    capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
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


require 'lspconfig'.lua_ls.setup {
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

require 'lspconfig'.prismals.setup {}
require 'lspconfig'.eslint.setup {}
require 'lspconfig'.cssmodules_ls.setup {}
require 'lspconfig'.solidity_ls.setup {}
require 'lspconfig'.vimls.setup {}
require("lspconfig").ccls.setup(config())
require 'lspconfig'.gopls.setup {}

require("luasnip.loaders.from_vscode").lazy_load()
require 'lspconfig'.bashls.setup {}



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

require 'lspconfig'.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { 'W391' },
          maxLineLength = 100
        }
      }
    }
  }
}

require 'lspconfig'.docker_compose_language_service.setup {}
require 'lspconfig'.dockerls.setup {}
local ls = require 'luasnip'
-- omnisharp
local nvim_lsp = require 'lspconfig'

local pid = vim.fn.getpid()
local omnisharp_bin = "/Users/brandonfidler/.dotfiles/omnisharp/run"

require 'lspconfig'.omnisharp.setup {
  cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },
  root_dir = nvim_lsp.util.root_pattern("*.csproj", "*.sln"),
}

-- fidler_lsp

local configs = require("lspconfig.configs")



-- Syntax highlight for Fidler files
vim.cmd [[ autocmd BufNewFile,BufRead /*.fdl setf fidler ]]

local configs = require("lspconfig.configs")
local home = os.getenv("HOME")

if not configs.fidler_lsp then
  configs.fidler_lsp = {
    default_config = {
      cmd = { "node", home .. "/personal/fidler-lsp/server.js", "--stdio" },
      filetypes = { 'fidler' },
      root_dir = function(fname)
        return require('lspconfig/util').path.dirname(fname)
      end,
      settings = {}
    }
  }
end
configs.fidler_lsp.setup {}

require 'lspconfig'.java_language_server.setup(config({
  cmd = { '/Users/brandonfidler/java-language-server/dist/lang_server_mac.sh' },
  root_dir = function(fname)
    return require 'lspconfig'.util.root_pattern('pom.xml', 'build.gradle', '.git')(fname) or vim.fn.getcwd()
  end,
}))
require 'lspconfig'.gradle_ls.setup(config({
  cmd = {
    '/Users/brandonfidler/lsp/vscode-gradle/gradle-language-server/build/install/gradle-language-server/bin/gradle-language-server' },
  root_dir = function(fname)
    return require 'lspconfig'.util.root_pattern('pom.xml', 'build.gradle', '.git')(fname) or vim.fn.getcwd()
  end,
}))

require("lspconfig").tsserver.setup(config({
  js_config = {
    eslint = { enable = false },
  },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
}))

require 'lspconfig'.tailwindcss.setup {
  cmd = {
    "node",
    "/Users/brandonfidler/personal/tailwindcss-intellisense/packages/tailwindcss-language-server/bin/tailwindcss-language-server",
    "--stdio" },
  filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "quorum" },
  root_dir = require('lspconfig/util').root_pattern("tailwind.config.js", "tailwind.config.ts", "tailwind.config.lua", "postcss.config.js", "postcss.config.ts", ".git"),
  init_options = {
    userLanguages = {
      quorum = "html"
    }
  },
  on_attach = function(client, bufnr)
    -- Optional: your custom on_attach code here
  end
}

vim.cmd [[
  augroup ThePrimeagenGroup
    autocmd!
    autocmd BufRead,BufNewFile *.quorum set filetype=quorum
    autocmd BufRead,BufNewFile *.quorum set syntax=java
  augroup END
]]

lsp.setup()
