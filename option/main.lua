function love.load()
	
	love.window.setFullscreen(true)
	-- récupère height/width fullscreen
  	desktopWidth, desktopHeight = love.window.getDesktopDimensions( display )

	option = {}
	progress = {}
	--nom de l'option
	option.name = {}

	-- ecart -> gap 
	gap = {}
	gap[1] = 2 * desktopHeight / 100 -- rectangle -> bar
	gap[2] = 5 * desktopHeight / 100 -- bar -> rectangle

	--parametres name 
	option.name.width = desktopWidth * 22.5 / 100
	option.name.height = desktopHeight * 12.5 / 100
	option.name.x = desktopWidth/2 - option.name.width/2
	--parametres bar
	option.bar = {}
	option.bar.width = 60*desktopWidth/100
	option.bar.height = 10*desktopHeight/100
	option.bar.x =  desktopWidth/2 - option.bar.width/2

	-- name.y et bar.x
	--TITLE
	option.name[1] = {}
	option.name[1].y = 100
	--option
	option.name[2] = {}
	option.name[2].y = 350

	option.bar[1] = {}
	option.bar[1].y = option.name[2].y + option.name.height + gap[1]

	option.name[3] = {}
	option.name[3].y = option.bar[1].y + option.name.height + gap[2]

	option.bar[2] = {}
	option.bar[2].y = option.name[3].y + option.name.height + gap[1]

	--progression bar
	--name
	progress.name = {}

	-- height/width
	progress.name.height = desktopHeight * 12.5 / 100 - 10
	progress.name.width = desktopWidth * 22.5 / 100 - 10

	--bar
	progress.bar = {}
	--height/width
	progress.bar.height = 10*desktopHeight/100 - 10
	progress.bar.width = 60*desktopWidth/100 - 10
	-- x et y bar
	progress.bar.x = option.bar.x + 5

	progress.bar[1] = {}
	progress.bar[1].y = option.bar[1].y + 5

	progress.bar[2] = {}
	progress.bar[2].y = option.bar[2].y + 5

end

function love.update()

	-- position x et y de mouse
  	xM, yM = love.mouse.getPosition()

end

function love.draw()

	love.graphics.setColor(255,255,255)		
	--title
	love.graphics.rectangle("fill",	option.name.x, option.name[1].y, option.name.width, option.name.height)
	--option
	love.graphics.rectangle("fill",	option.name.x, option.name[2].y, option.name.width, option.name.height)
	love.graphics.rectangle("fill",	option.bar.x, option.bar[1].y, option.bar.width, option.bar.height)

	love.graphics.rectangle("fill",	option.name.x, option.name[3].y, option.name.width, option.name.height)
	love.graphics.rectangle("fill",	option.bar.x, option.bar[2].y, option.bar.width, option.bar.height)
  
	--progression bar
	love.graphics.setColor(200,100,0)

	love.graphics.rectangle("fill", progress.bar.x, progress.bar[1].y, progress.bar.width, progress.bar.height)
	love.graphics.rectangle("fill", progress.bar.x, progress.bar[2].y, progress.bar.width, progress.bar.height)

end

function love.mousepressed (x, y, button)

 	xM, yM = love.mouse.getPosition()

 	-- progress
	if xM > option.bar.x and xM < option.bar.x + progress.bar.width and yM > option.bar[1].y and yM < progress.bar[1].y + progress.bar.height and button == 1 then
		print("bar 1")
	end

	if xM > option.bar.x and xM < option.bar.x + progress.bar.width and yM > option.bar[2].y and yM < progress.bar[2].y + progress.bar.height and button == 1 then
		print("bar 2")
	end

end