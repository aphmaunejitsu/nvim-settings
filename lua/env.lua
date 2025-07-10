-- 環境検出とそれに応じた設定
local M = {}

-- 実行環境の検出
M.is_vscode = vim.g.vscode ~= nil
M.is_terminal = not M.is_vscode
M.is_gui = vim.fn.has('gui_running') == 1 or vim.fn.exists('g:neovide') == 1

-- VSCode環境かどうかを返す関数
function M.vscode()
  return M.is_vscode
end

-- ターミナル環境かどうかを返す関数
function M.terminal()
  return M.is_terminal
end

-- GUI環境かどうかを返す関数
function M.gui()
  return M.is_gui
end

-- デバッグ用: 現在の環境情報を表示
function M.print_env()
  print("Environment Info:")
  print("  VSCode: " .. tostring(M.is_vscode))
  print("  Terminal: " .. tostring(M.is_terminal))
  print("  GUI: " .. tostring(M.is_gui))
  if M.is_vscode then
    print("  Running in VSCode")
  elseif M.is_gui then
    print("  Running in GUI")
  else
    print("  Running in Terminal")
  end
end

return M
