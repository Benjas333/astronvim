local M = {}

local uv = vim.uv or vim.loop

---@class OsInfo
---@field name "windows"|"linux"|"darwin"
---@field arch "amd64"|"arm64"
local OsInfo = {}

local uname = uv.os_uname()
local os = uname.sysname
local arch = uname.machine

if os == "linux" then
  os = "linux"
elseif os == "darwin" then
  os = "darwin"
elseif string.match(os, "windows") ~= nil then
  os = "windows"
end
if arch == "x86_64" then
  arch = "amd64"
elseif arch == "aarch64" then
  arch = "arm64"
end

---@type OsInfo
M.os = {
  name = os,
  arch = arch,
}

M.highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
}

M.dark_highlight = {
  "RainbowDarkRed",
  "RainbowDarkYellow",
  "RainbowDarkBlue",
  "RainbowDarkOrange",
  "RainbowDarkGreen",
  "RainbowDarkViolet",
  "RainbowDarkCyan",
}

return M
