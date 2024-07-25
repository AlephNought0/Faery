local dap = require('dap')
local dapui = require('dapui')

dapui.setup()

local function on_session_start()
    dapui.open()
end

dap.listeners.after.event_initialized["dapui"] = on_session_start

dap.listeners.after.event_continued["dapui"] = on_session_start
