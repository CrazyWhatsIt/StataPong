capture program drop pong
program define pong
	local debug = 0
	if `debug' display "[PONG] Start pong!"
	if `debug' display "[PONG] Start initialize ..."
	initialize_pong
	if `debug' display "[PONG] Initialize complete ..."
	if `debug' display "[PONG] Start game run ..."
	run_pong
	if `debug' display "[PONG] Game run complete ..."
	if `debug' display "[PONG] Cleanup enviroment ..."
	cleanup_pong
	if `debug' display "[PONG] Cleanup complete ..."
	if `debug' display "[PONG] exit game."
end
