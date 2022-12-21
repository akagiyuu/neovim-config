local hint = [[
 ^^^                    Debug
 ^^^--------------------------------------------------
 _c_: Continue                  _p_: Toggle breakpoint
 _i_: Step in                   _o_: Step over
 _u_: Step out                  _b_: Step back
 _s_: Start debug               _q_: Stop debug
]]
local diagnostic = {
    name = 'Diagnostic',
    hint = hint,
    config = {
        color = 'pink',
        timeout = 1000,
        invoke_on_body = true,
        hint = {
            position = 'bottom',
            border = 'rounded',
        },
    },
    mode = { 'n' },
    body = '<leader>d',
    heads = {
        {
            's',
            function()
                require 'dap'.continue()
                require 'dapui'.open()
            end,
            { nowait = true },
        },
        {
            'q',
            function()
                require 'dap'.close()
                require 'dapui'.close()
            end,
            { nowait = true },
        },
        { 'c', function() require 'dap'.continue() end, { nowait = true } },
        { 'p', function() require 'dap'.toggle_breakpoint() end, { nowait = true } },
        { 'i', function() require 'dap'.step_into() end, { nowait = true } },
        { 'o', function() require 'dap'.step_over() end, { nowait = true } },
        { 'b', function() require 'dap'.step_back() end, { nowait = true } },
        { 'u', function() require 'dap'.step_out() end, { nowait = true } },
    },
}
return diagnostic

