 -- /home/stevearc/.config/nvim/lua/overseer/template/user/cpp_build.lua
return {
  name = "clang++ build",
  builder = function()
    -- Full path to current file (see :help expand())
    local file = vim.fn.expand("%:p")
    return {
      cmd = { "clang++" },
      args = { '-std=c++20', file },
      components = { { "on_output_quickfix", open = true }, "default" },
    }
  end,
  condition = {
    filetype = { "cpp" },
  },
}
