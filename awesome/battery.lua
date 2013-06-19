local vicious = require("vicious")
local wibox = require("wibox")

batwidget = wibox.widget.textbox()

-- Register widget
vicious.register(batwidget, vicious.widgets.bat,
  function (widget, args)
    if args[2] == 0 then return ""
    else
      return args[2] .. args[1]
    end
  end, 61, "BAT0"
)
-- }}}
