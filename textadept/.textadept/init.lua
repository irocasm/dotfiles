
--if not CURSES then buffer:set_theme('base16-ashes-dark') end
if not CURSES then buffer:set_theme('dark', {font = 'Source Code Variable'}) end

buffer.use_tabs = true
buffer.tab_width = 4

textadept.editing.strip_trailing_spaces = true
buffer.wrap_visual_flags = buffer.WRAPVISUALFLAG_MARGIN

function toggle_wrap()
	if buffer.wrap_mode == buffer.WRAP_NONE then
		buffer.wrap_mode = buffer.WRAP_WHITESPACE
	else
		buffer.wrap_mode = buffer.WRAP_NONE
	end
end

local context_menu = textadept.menu.context_menu
context_menu[#context_menu + 1] = {"Toggle Wrapping", toggle_wrap}
context_menu[#context_menu + 1] = {"Reset", reset}

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
