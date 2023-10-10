local _dap = {
    'mfussenegger/nvim-dap',
    dependencies = {
        {
            'rcarriga/nvim-dap-ui',
            config = true,
        },
        {
            'theHamsta/nvim-dap-virtual-text',
            opts = {
                highlight_new_as_changed = true,
                commented = true,
            }
        }
    },
}

_dap.config = function(_, opts)
    local dap = require('dap')
    dap.defaults.fallback.external_terminal = {
        command = 'kitty',
        args = { '-e' },
    }

    dap.adapters.lldb = {
        type = 'executable',
        command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
        name = 'lldb'
    }
    dap.configurations.c = {
        {
            name = 'Launch',
            type = 'lldb',
            request = 'launch',
            program = '${fileDirname}/${fileBasenameNoExtension}',
            cwd = '${workspaceFolder}',
            stopOnEntry = true,
            args = {},

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
            terminal = 'integrated',
        },
    }

    dap.configurations.cpp = dap.configurations.c

    for group, sign in pairs {
        ['DapBreakpoint'] = '●',
        ['DapBreakpointCondition'] = '●',
        ['DapLogPoint'] = '◆',
    } do
        vim.fn.sign_define(group, { text = sign, texthl = group, linehl = '', numhl = '' })
    end

    dap.listeners.before['event_initialized'].ui = function() require('dapui').open() end
    dap.listeners.before.event_terminated['dapui_config'] = function() require('dapui').close() end
    dap.listeners.before.event_exited['dapui_config'] = function() require('dapui').close() end
end

return _dap
