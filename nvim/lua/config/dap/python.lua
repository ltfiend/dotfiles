local M = {}

function M.setup(_)
  require("dap-python").setup('~/.virtualenvs/debugpy/bin/python')
end

-- ./inspector --defaultsfile etc/default_values.conf -g geoip/ -F template -t ~/Work/all-fields-custom.tpl /var/log/Earth-20221213-01*.cdns -o -|less

--       name = "Inspector",
--       type = "lldb",
--       request = "launch",
--       program = "./inspector",
--       args = {'--defaultsfile', 'etc/default_values.conf', '-F', 'template', '-t', '/home/peter/Work/all-fields-custom.tpl', 'Earth-20221213-011810_60_enp7s0.cdns', '-o', '-'},
--       cwd = '${workspaceFolder}',
--       stopOnEntry = false,
--       runInTerminal = false,
--       postRunCommands = {'process handle -p true -s false -n false SIGWINCH'},
--       env = function()
--         local variables = {}
--         for k, v in pairs(vim.fn.environ()) do
--           table.insert(variables, string.format("%s=%s", k, v))
--         end
--         return variables
--       end,
--     },
-- 
return M
