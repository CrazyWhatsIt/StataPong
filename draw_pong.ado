capture program drop draw_pong
program define draw_pong
	local debug = 1
	if `debug' display "[DRAW][START] draw pong routine start!"
	* There are two points on this plot, the ball and the paddle.
	if `debug' display "[DRAW] setup temporary dataset to represent current state ..."
	if !(_N == 6) {
		clear
		quietly set obs 6
	}
	* View objects have x and y coordinates.
	tempvar x
	quietly gen `x' = .
	tempvar y
	quietly gen `y' = .
	if `debug' display "[DRAW] set up static coordinates ..."
	* Need to draw four corners to maintain window scale.
	* top left
	di `.Global.pongstate.const.leftbound'
	quietly replace `x' = `.Global.pongstate.const.leftbound' in 1
	quietly replace `y' = `.Global.pongstate.const.upperbound' in 1
	* top right
	quietly replace `x' = `.Global.pongstate.const.rightbound' in 2
	quietly replace `y' = `.Global.pongstate.const.upperbound' in 2
	* bottom left
	quietly replace `x' = `.Global.pongstate.const.leftbound' in 3
	quietly replace `y' = `.Global.pongstate.const.lowerbound' in 3
	* bottom right
	quietly replace `x' = `.Global.pongstate.const.rightbound' in 4
	quietly replace `y' = `.Global.pongstate.const.lowerbound' in 4
	if `debug' display "[DRAW] set up dynamic coordinates ..."
	* ball coordinates
	quietly replace `x' = `.Global.pongstate.const.ballcurrent.x' in 5
	quietly replace `y' = `.Global.pongstate.const.ballcurrent.y' in 5
	* paddle coordinates
	quietly replace `x' = `.Global.pongstate.const.paddlecurrent.x' in 6
	quietly replace `y' = `.Global.pongstate.const.paddlecurrent.y' in 6
	if `debug' display "[DRAW] draw the frame ..."
	* draw as ascii art.
	plot `x' `y'
	if `debug' display "[DRAW][END] draw pong routine end!"
end
