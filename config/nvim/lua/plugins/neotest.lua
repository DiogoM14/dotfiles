return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "haydenmeade/neotest-jest",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-jest")({
            jestCommand = "npx jest",
            jestConfigFile = function(file)
              local function find(path)
                for _, name in ipairs({ "jest.config.ts", "jest.config.js" }) do
                  local cfg = path .. "/" .. name
                  if vim.fn.filereadable(cfg) == 1 then return cfg end
                end
                local parent = vim.fn.fnamemodify(path, ":h")
                if parent == path then return nil end
                return find(parent)
              end
              return find(vim.fn.fnamemodify(file, ":h"))
            end,
            env = { CI = true },
            cwd = function(file)
              local function find(path)
                for _, name in ipairs({ "jest.config.ts", "jest.config.js" }) do
                  if vim.fn.filereadable(path .. "/" .. name) == 1 then return path end
                end
                local parent = vim.fn.fnamemodify(path, ":h")
                if parent == path then return vim.fn.getcwd() end
                return find(parent)
              end
              return find(vim.fn.fnamemodify(file, ":h"))
            end,
          }),
        },
      })
    end,
    keys = {
      { "<leader>tt", function() require("neotest").run.run() end, desc = "Run nearest test" },
      { "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run file tests" },
      { "<leader>ts", function() require("neotest").summary.toggle() end, desc = "Toggle test summary" },
      { "<leader>to", function() require("neotest").output.open() end, desc = "Show test output" },
    },
  },
  {
    "andythigpen/nvim-coverage",
    config = function()
      require("coverage").setup({
        commands = true,
        highlights = {
          covered = { fg = "#7ee787" },
          uncovered = { fg = "#ff7b72" },
        },
      })
    end,
    keys = {
      { "<leader>tc", "<cmd>Coverage<cr>", desc = "Show coverage" },
      { "<leader>tC", "<cmd>CoverageToggle<cr>", desc = "Toggle coverage" },
    },
  },
}
