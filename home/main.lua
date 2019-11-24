-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')
 
function love.load()

	play = {}
	settings  = {}
	exit = {}

	love.window.setFullscreen(true)

	-- récupère height/width fullscreen
  	desktopWidth, desktopHeight = love.window.getDesktopDimensions( display )

	love.graphics.setColor(200,100,0)

	--parametre play
	play.img = love.graphics.newImage("play.png")
	play.width = play.img:getWidth()
	play.height = play.img:getHeight()

	-- parametre exit
	exit.img = love.graphics.newImage("exit.png")
	exit.width = exit.img:getWidth()
	exit.height = exit.img:getHeight() 

	-- width et height rectangle
	width = desktopWidth * 22 / 100
	height = desktopHeight * 12 / 100

	-- convertit play
	play.pourcX = 100 * width / desktopWidth
	play.pourcY = 100 * height/ desktopHeight
	play.scaleX = play.pourcX/5
	play.scaleY = play.pourcY/5

	x = {}
	y = {}

	-- ecart
	gap = 2 * desktopHeight / 100

	y[1] = desktopHeight/2 - height/1
	y[2] = y[1] + height + gap
	y[3] = y[1] + height + gap + height + gap

	x[1] = desktopWidth/2 - width/2
	x[2] = desktopWidth/2 - width/4

	gap = 2 * desktopHeight / 100

	--title
	widthT = desktopWidth / 3
	heightT = desktopHeight / 5
	yT = gap

end

function love.update(dt)



end

function love.draw()

	--title
	love.graphics.rectangle("fill",desktopWidth/2 - widthT/2, yT, widthT, heightT)

	function love.mousepressed (xM, yM, button)

		if xM > x[1] and xM < x[1] + width and yM > y[1] and yM < y[1] + height and button == 1 then
			love.graphics.print("good 1 !", 1,30)
			print("1")
		end

		if xM > x[1] and xM < x[1] + width and yM > y[2] and yM < y[2] + height and button == 1 then
			love.graphics.print("good 2 !", 1,40)
			print("2")
		end
	end

  	--rectangle
	love.graphics.rectangle("fill",x[1],y[2], width, height)
	love.graphics.rectangle("fill",x[1],y[3], width, height)

	love.graphics.draw(play.img, x[1], y[1],0, play.scaleX, play.scaleY)
	love.graphics.draw(exit.img, x[2], y[2],0, play.scaleX + 0.3, play.scaleY + 0.3)

end