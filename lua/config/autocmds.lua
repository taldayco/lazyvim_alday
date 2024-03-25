-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
-- Autocmd for creating .h and .cpp files for C++ classes
-- This file is automatically loaded by lazyvim.config.init.

-- This file is automatically loaded by lazyvim.config.init.

-- This file is automatically loaded by lazyvim.config.init.

-- This file is automatically loaded by lazyvim.config.init.

local function augroup(name)
  vim.cmd("augroup " .. name)
  vim.cmd("autocmd!")
end

augroup("CreateCppClass")

-- Define the autocmd for creating .h and .cpp files
vim.cmd([[
  autocmd CreateCppClass CmdlineEnter :cpp class * call v:lua.CreateCppClass()
  augroup END
]])

-- Function to create .h and .cpp files
function CreateCppClass()
  local line = vim.fn.getline(".")
  local parts = vim.split(line, " ")
  if #parts >= 3 and parts[2] == "class" then
    local class_name = parts[3]
    local header_path = vim.fn.expand("~/header/") .. class_name .. ".h"
    local src_path = vim.fn.expand("~/src/") .. class_name .. ".cpp"

    -- Create the .h and .cpp files
    vim.fn.system("touch " .. header_path)
    vim.fn.system("touch " .. src_path)

    -- Open the newly created files
    vim.cmd("edit " .. header_path)
    vim.cmd("split " .. src_path)
  end
end
