capture program drop run_pong
program define run_pong
	local debug = 0
	local auto = 0
	if `debug' display "[RUN][START] run routine start!"
	if `debug' display "[RUN] draw the screen for the first time ..."
	draw_pong
	while `.Global.pongstate.gameover' == 0 {
		if `auto'{
			if `debug' display "[RUN][AUTO] update paddle coordinates ..."
			.Global.pongstate.auto_update_paddle_position
		}
		if `debug' display "[RUN] paddle coordinates are (" `.Global.pongstate.paddlecurrent.x' ", " `.Global.pongstate.paddlecurrent.y' ")"
		if `debug' display "[RUN] update ball coordinates ..."
		.Global.pongstate.updateballposition
		if `debug' display "[RUN] paddle coordinates are (" `.Global.pongstate.ballcurrent.x' ", " `.Global.pongstate.ballcurrent.y' ")"
		if `debug' display "[RUN] re-draw the screen ..."
		draw_pong
		if `debug' display "[RUN] check to see if the game is over ..."
		.Global.pongstate.checkgameover
		if `debug' & !(`.Global.pongstate.gameover' == 0) display "[RUN] confirmed game end ..."
	}
	if `debug' display "[RUN][END] run routine end!"
end
