local yarepl = require("yarepl")
print("loading yarepl config")

local M = {
    -- see `:h buflisted`, whether the REPL buffer should be buflisted.
    buflisted = false,
    -- whether the REPL buffer should be a scratch buffer.
    scratch = true,
    -- the filetype of the REPL buffer created by `yarepl`
    ft = 'REPL',
    -- How yarepl open the REPL window, can be a string or a lua function.
    -- See below example for how to configure this option
    wincmd = 'vertical 50 split',
    -- The available REPL palattes that `yarepl` can create REPL based on
    metas = {
        -- aichat = {
        --     cmd = 'aichat',
        --     formatter = yarepl.formatter.bracketed_pasting
        -- },
        -- radian = {
        --     cmd = 'radian',
        --     formatter = yarepl.formatter.bracketed_pasting
        -- },
        ipython = {
            cmd = '/home/rudy/ds/bin/ipython --no-autoindent',
            formatter = yarepl.formatter.bracketed_pasting
        }
        -- python = {
        --     cmd = '/home/rudy/ds/bin/python',
        --     formatter = yarepl.formatter.trim_empty_lines
        -- },
        -- R = {cmd = 'R', formatter = yarepl.formatter.trim_empty_lines},
        -- bash = {cmd = 'bash', formatter = yarepl.formatter.trim_empty_lines},
        -- zsh = {cmd = 'zsh', formatter = yarepl.formatter.bracketed_pasting}
    },
    -- when a REPL process exits, should the window associated with those REPLs closed?
    close_on_exit = true,
    -- whether automatically scroll to the bottom of the REPL window after sending
    -- text? This feature would be helpful if you want to ensure that your view
    -- stays updated with the latest REPL output.
    scroll_to_bottom_after_sending = true
}
return M