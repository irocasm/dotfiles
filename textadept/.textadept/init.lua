--if not CURSES then buffer:set_theme('base16-ashes-dark') end
if not CURSES then buffer:set_theme('dark', {font = 'Source Code Variable'}) end

buffer.use_tabs = true
buffer.tab_width = 4

textadept.editing.strip_trailing_spaces = true

local context_menu = textadept.menu.context_menu
context_menu[#context_menu + 1] = {"Reset", reset}
--context_menu[#context_menu + 1] = {"Print", function() ui.print("Hello textadept") end}

_M.spellcheck = require('spellcheck')

-- View mode
args.register('-vm', '--view-mode', 0, function()
  -- Make all opened buffers read-only.
  events.connect(events.FILE_OPENED, function()
    buffer.read_only = true
  end)
  -- Hide the menubar.
  textadept.menu.menubar = nil
end, 'View-only mode')
