-- ~/.config/nvim/plugin/0-tangerine.lua or ~/.config/nvim/init.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- pick your plugin manager
local pack = "lazy"
local nvim_dir = vim.fn.stdpath [[config]]
local nvim_data = vim.fn.stdpath [[data]]

local function bootstrap(url, ref)
    local name = url:gsub(".*/", "")
    local path

    if pack == "lazy" then
        path = vim.fn.stdpath("data") .. "/lazy/" .. name
        vim.opt.rtp:prepend(path)
    else
        path = vim.fn.stdpath("data") .. "/site/pack/".. pack .. "/start/" .. name
    end

    if vim.fn.isdirectory(path) == 0 then
        print(name .. ": installing in data dir...")

        vim.fn.system {"git", "clone", url, path}
        if ref then
            vim.fn.system {"git", "-C", path, "checkout", ref}
        end

        vim.cmd "redraw"
        print(name .. ": finished installing")
    end
end

-- for stable version [recommended]
bootstrap("https://github.com/udayvir-singh/tangerine.nvim", "v2.7")
bootstrap("https://github.com/udayvir-singh/hibiscus.nvim", "v1.7")


-- require "tangerine".setup {}
require "tangerine".setup {
   vimrc   = nvim_dir .. "/init.fnl",
   source  = nvim_dir .. "/fnl",

-- Lazy seems to not find it on the package path so we append 'lua' and use rtp (rtp requries lua path)
  target = nvim_data .. "/tangerine/lua",

  compiler = {
    -- disable popup showing compiled files
    verbose = false,

    -- compile every time changed are made to fennel files or on entering vim
    hooks = {"onsave", "oninit"}
	}
}
