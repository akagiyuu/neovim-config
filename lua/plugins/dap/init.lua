local M = {
    'mfussenegger/nvim-dap',
    dependencies = {
        require(... .. '.ui'),
        require(... .. '.virtual_text'),
    },
}

M.config = function()
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
    dap.adapters.coreclr = {
        type = 'executable',
        command = vim.fn.stdpath('data') .. '/mason/bin/netcoredbg',
        args = { '--interpreter=vscode' }
    }
    dap.configurations.c = {
        {
            name = 'Launch',
            type = 'lldb',
            request = 'launch',
            program = '${fileDirname}/build/${fileBasenameNoExtension}',
            cwd = '${workspaceFolder}',
            stopOnEntry = true,
            args = {},

            runInTerminal = true,
        },
    }

    dap.configurations.cpp = dap.configurations.c
    dap.configurations.cs = {
        {
            type = 'coreclr',
            name = 'launch - netcoredbg',
            request = 'launch',
            stopOnEntry = true,
            program = function()
                local cwd = vim.fn.getcwd()
                local file_name = vim.fn.fnamemodify(cwd, ':t')
                return vim.fn.input('Path to dll: ', cwd .. '/bin/Debug/net7.0/' .. file_name .. '.dll', 'file')
            end,
        },
    }

    local sign = vim.fn.sign_define

    sign('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
    sign('DapBreakpointCondition', { text = '●', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' })
    sign('DapLogPoint', { text = '◆', texthl = 'DapLogPoint', linehl = '', numhl = '' })

    dap.listeners.before['event_initialized'].ui = function() require('dapui').open() end
    dap.listeners.before.event_terminated['dapui_config'] = function() require('dapui').close() end
    dap.listeners.before.event_exited['dapui_config'] = function() require('dapui').close() end
end

return M
