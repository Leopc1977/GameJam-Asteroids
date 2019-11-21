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
	y[3] = y[1] + height + gap
	y[4] = y[2] + height + gap

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

  	xM, yM = love.mouse.getPosition()
  	love.graphics.print(xM,1,1)
  	love.graphics.print(yM,1,20)
  	--rectangle
  	love.graphics.rectangle("fill",x[1],y[1], width, height)
	love.graphics.rectangle("fill",x[1],y[2], width, height)
	love.graphics.rectangle("fill",x[1],y[3] + height + gap, width, height)
	love.graphics.rectangle("fill",x[1],y[4] + height + gap, width, height)

end