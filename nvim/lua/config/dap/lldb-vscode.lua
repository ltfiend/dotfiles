local M = {}

function M.setup()
  local dap = require"dap"
--   dap.configurations.rs = {
--     {
--       name = "Cargo",
--       type = "lldb",
--       request = "launch",
--       program = "/usr/bin/cargo",
--       args = {'run'},
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
--   }
  dap.configurations.cpp = {
    {
      name = "Launch",
      type = "lldb",
      request = "launch",
      -- program = function()
      --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      -- end,
      -- cwd = '${workspaceFolder}',
      -- program = "./inspector",
      args = {},
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
      --
      --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
      --
      -- Otherwise you might get the following error:
      --
      --    Error on launch: Failed to attach to the target process
      --
      -- But you should be aware of the implications:
      -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
  
      runInTerminal = false,
      -- If you use `runInTerminal = true` and resize the terminal window,
      -- lldb-vscode will receive a `SIGWINCH` signal which can cause problems
      -- To avoid that uncomment the following option
      -- See https://github.com/mfussenegger/nvim-dap/issues/236#issuecomment-1066306073
      postRunCommands = {'process handle -p true -s false -n false SIGWINCH'},
      env = function()
        local variables = {}
        for k, v in pairs(vim.fn.environ()) do
          table.insert(variables, string.format("%s=%s", k, v))
        end
        return variables
      end,
    },
    {
      -- If you get an "Operation not permitted" error using this, try disabling YAMA:
      --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
      name = "Attach to process",
      type = 'lldb',  -- Adjust this to match your adapter name (`dap.adapters.<name>`)
      request = 'attach',
      pid = require('dap.utils').pick_process,
      args = {},
    },
    {
      name = "Inspector",
      type = "lldb",
      request = "launch",
      program = "./inspector",
      args = { '-F', 'template', '-t', 'test-no-geo-custom.tpl', 'ecs-test-2.cdns', '-o', '-' },
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      runInTerminal = false,
      postRunCommands = {'process handle -p true -s false -n false SIGWINCH'},
      env = function()
        local variables = {}
        for k, v in pairs(vim.fn.environ()) do
          table.insert(variables, string.format("%s=%s", k, v))
        end
        return variables
      end,
    },
    {
      name = "Compactor",
      type = "lldb",
      request = "launch",
      program = "./compactor",
      args = { '-o', 'test-out.cdns', 'dns-sample.tcpd' },
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      runInTerminal = false,
      postRunCommands = {'process handle -p true -s false -n false SIGWINCH'},
      env = function()
        local variables = {}
        for k, v in pairs(vim.fn.environ()) do
          table.insert(variables, string.format("%s=%s", k, v))
        end
        return variables
      end,
    },
    {
      name = "AOut",
      type = "lldb",
      request = "launch",
      program = "./a.out",
      args = {},
      cwd = '${workspaceFolder}',
      stopOnEntry = false,
      runInTerminal = false,
      postRunCommands = {'process handle -p true -s false -n false SIGWINCH'},
      env = function()
        local variables = {}
        for k, v in pairs(vim.fn.environ()) do
          table.insert(variables, string.format("%s=%s", k, v))
        end
        return variables
      end,
    },
  }  
  
  dap.configurations.c = dap.configurations.cpp
--  dap.configurations.rust = dap.configurations.cpp
--    dap.configurations.rust = dap.configurations.rs
    
  dap.adapters.lldb = {
    type = 'executable',
    command = '/bin/lldb-vscode-12',
    name = "lldb"
  }
end

return M
