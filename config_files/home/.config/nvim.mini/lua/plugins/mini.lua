local minis = {}
for _,mini in ipairs({
	"pairs",
	"surround",
	"animate",
	"cursorword",
	"files",
	"indentscope",
	"icons",
	"tabline",
	"starter",
	-- "map",
	"statusline",
}) do
	table.insert(minis ,{ "echasnovski/mini." .. mini, version = '*' })
end
return (minis)


--- Documentation

--- mini.surround
-- Add surrounding with sa (in visual mode or on motion).
	-- sa'iw => suround add ' inside word
	-- sa'a" => suround add ' around "
-- Delete surrounding with sd.
-- Replace surrounding with sr.
-- Find surrounding with sf or sF (move cursor right or left).
-- Highlight surrounding with sh.


--- mini.files
-- close       = 'q',
-- go_in       = 'l',
-- go_in_plus  = 'L',
-- go_out      = 'h',
-- go_out_plus = 'H',
-- mark_goto   = "'",
-- mark_set    = 'm',
-- reset       = '<BS>',
-- reveal_cwd  = '@',
-- show_help   = 'g?',
-- synchronize = '=',
-- trim_left   = '<',
-- trim_right  = '>',
