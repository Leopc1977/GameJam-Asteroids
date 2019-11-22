-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

function love.load()

	love.window.setFullscreen(true)

	-- récupère height/width fullscreen
  	desktopWidth, desktopHeight = love.window.getDesktopDimensions( display )

	love.graphics.setColor(200,100,0)

	-- convertit rectangle
	width = desktopWidth * 22 / 100
	height = desktopHeight * 12 / 100

	x = {}
	y = {}

	-- ecart
	gap = 2 * desktopHeight / 100

	y[1] = desktopHeight/2 - height/1
	y[2] = y[1] + height + gap
	y[3] = y[1] + height + gap + height + gap
	y[4] = y[2] + height + gap + height + gap

	x[1] = desktopWidth/2 - width/2

	gap = 2 * desktopHeight / 100

	--title
	widthT = desktopWidth / 3
	heightT = desktopHeight / 5
	yT = gap

end

function love.update(dt)

	-- convertit rectangle
	width = desktopWidth * 22.5 / 100
	height = desktopHeight * 12.5 / 100

end

function love.draw()

	--title
	love.graphics.rectangle("fill",desktopWidth/2 - widthT/2, yT, widthT, heightT)

	--test
  	xM, yM = love.mouse.getPosition()
  	love.graphics.print(xM,1,1)
  	love.graphics.print(yM,1,20)

	function love.mousepressed (xM, yM, button)

	if xM > x[1] and xM < x[1] + width and yM > y[1] and yM < y[1] + height and button == 1 then
		love.graphics.print("good 1 !", 1,30)
		print("1")
	end

	if xM > x[1] and xM < x[1] + width and yM > y[2] and yM < y[2] + height and button == 1 then
		love.graphics.print("good 2 !", 1,40)
		print("2")
	end

	if xM > x[1] and xM < x[1] + width and yM > y[3] and yM < y[3] + height and button == 1 then
		love.graphics.print("good 3 !", 1,50)
		print("3")
	end

	if xM > x[1] and xM < x[1] + width and yM > y[4] and yM < y[4] + height and button == 1 then
		love.graphics.print("good 4 !", 1,60)
		print("4")
	end
end
  	--rectangle
  	love.graphics.rectangle("fill",x[1],y[1], width, height)
	love.graphics.rectangle("fill",x[1],y[2], width, height)
	love.graphics.rectangle("fill",x[1],y[3], width, height)
	love.graphics.rectangle("fill",x[1],y[4], width, height)

end