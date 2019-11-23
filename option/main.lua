function love.load()
	
	love.window.setFullscreen(true)
	-- récupère height/width fullscreen
  	desktopWidth, desktopHeight = love.window.getDesktopDimensions( display )

	option = {}

	--nom de l'option
	option.name = {}

	-- ecart -> gap 
	gap = {}
	gap[1] = 2 * desktopHeight / 100 -- rectangle -> bar
	gap[2] = 5 * desktopHeight / 100 -- bar -> rectangle

	--parametres name 
	option.name.width = desktopWidth * 22.5 / 100
	option.name.height = desktopHeight * 12.5 / 100
	option.name.nameX = desktopWidth/2 - option.name.width/2
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

	option.name[3] = {}
	option.name[3].y = 	option.name[2].y + option.name.height + gap[1]

	option.name[4] = {}
	option.name[4].y = option.name[3].y + option.name.height + gap[2]

	option.name[5] = {}
	option.name[5].y = option.name[4].y + option.name.height + gap[1]


end

function love.update()
	


end

function love.draw()
			
	--title
	love.graphics.rectangle("fill",	option.name.nameX, option.name[1].y, option.name.width, option.name.height)
	--option
	love.graphics.rectangle("fill",	option.name.nameX, option.name[2].y, option.name.width, option.name.height)
	love.graphics.rectangle("fill",	option.bar.x, option.name[3].y, option.bar.width, option.bar.height)

	love.graphics.rectangle("fill",	option.name.nameX, option.name[4].y, option.name.width, option.name.height)
	love.graphics.rectangle("fill",	option.bar.x, option.name[5].y, option.bar.width, option.bar.height)

end