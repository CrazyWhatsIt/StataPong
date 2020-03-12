capture program drop initialize_pong
program define initialize_pong
	local debug = 0
	if `debug' display "[INITIALIZE][START] initialization routine start!"
	if `debug' display "[INITIALIZE] get setings from the file system ..."
	.const = .constant.new
	if `debug' display "[INITIALIZE] generate new state class instance ..."
	* Globalize because it looks like a class instances cannot be passed as 
	* a program argument or as a return value.
	.Global.pongstate = .state.new
	.Global.pongstate.const.ref = .const.ref
	if `debug' display "[INITIALIZE] randomly generate starting ball coordinate."
	.initballcoord = .coordinate.new
	* obs can't be zero for random number generation.
	clear
	quietly set obs 1
	scalar start_ball_x = int(runiform(`.const.leftbound', `.const.rightbound'))
	scalar start_ball_y = `.const.upperbound'
	.initballcoord.x = start_ball_x
	.initballcoord.y = start_ball_y
	* Initial state is the same instance as .initballcoord
	.Global.pongstate.ballstart.ref = .initballcoord.ref
	* Ball current should update without overwriting .ballstart so use copy 
	* syntax instead.
	.Global.pongstate.ballcurrent = .initballcoord
	if `debug' display "[INITIALIZE] ball coord set to (" start_ball_x ", " start_ball_y ")"
	if `debug' display "[INITIALIZE] randomly generate ball starting velocity"
	scalar x_ball_velocity = runiform(0, `.const.velocity')
	scalar y_ball_velocity = 1 - x_ball_velocity
	.Global.pongstate.xballvelocity = x_ball_velocity
	.Global.pongstate.yballvelocity = -y_ball_velocity
	if `debug' display "[INITIALIZE] ball velocity set to (" x_ball_velocity ", " -y_ball_velocity ")""
	if `debug' display "[INITIALIZE] set starting paddle coordinate."
	.initpaddlecoord = .coordinate.new
	scalar start_pad_x = ((`.const.rightbound' - `.const.leftbound') / 2) + `.const.leftbound'
	scalar start_pad_y = (0.05 * (`.const.upperbound' - `.const.lowerbound')) + `.const.lowerbound'
	.initpaddlecoord.x = start_pad_x
	.initpaddlecoord.y = start_pad_y
	* Initial state is the same instance as .initpaddlecoord
	.Global.pongstate.paddlestart.ref = .initpaddlecoord.ref
	* Ball current should update without overwriting .initpaddlecoord so use copy 
	* syntax instead.
	.Global.pongstate.paddlecurrent = .initpaddlecoord
	if `debug' display "[INITIALIZE] paddle coord set to (" start_pad_x ", " start_pad_y ")"
	if `debug' display "[INITIALIZE][STOP] initialization routine end!"
end
