capture program drop cleanup_pong
program define cleanup_pong
	local debug = 0
	if `debug' display "[CLEANUP][START] cleanup pong start!"
	if `debug' display "[CLEANUP] discard objects from memory."
	discard
	if `debug' display "[CLEANUP][END] cleanup pong end!"
end
