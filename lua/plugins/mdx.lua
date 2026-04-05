return {
  -- Renderização in-buffer de markdown/MDX
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      file_types = { "markdown", "mdx" },
    },
    ft = { "markdown", "mdx" },
  },

  -- Preview no browser (suporta MDX via markdown)
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown", "mdx" },
  },

  -- Treesitter: adiciona parsers e registra filetype MDX
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "markdown",
        "markdown_inline",
        "tsx",
        "javascript",
      })
    end,
    init = function()
      -- LazyVim registra mdx como "markdown.mdx"; usamos o mesmo padrão
      vim.treesitter.language.register("markdown", "markdown.mdx")
    end,
  },

  -- Desativa markdownlint em arquivos markdown e MDX
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft["markdown"] = {}
      opts.linters_by_ft["mdx"] = {}
      opts.linters_by_ft["markdown.mdx"] = {}
    end,
  },
}
