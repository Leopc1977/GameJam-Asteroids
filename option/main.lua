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

	--width qui varie pour le volume
	progress.width = {}
	progress.width[1] =  60*desktopWidth/100 - 10
	progress.width[2] = 60*desktopWidth/100 - 10

	-- x et y bar
	progress.bar.x = option.bar.x + 5

	progress.bar[1] = {}
	progress.bar[1].y = option.bar[1].y + 5

	progress.bar[2] = {}
	progress.bar[2].y = option.bar[2].y + 5

	--calcule distance entre coté gauche de l'ecran et le coté gauche de la bar 2 point
	--[[local xa = 0
	local ya = progress.bar[1].y
	local xb = option.bar.x
	local yb = progress.bar[1].y
	progress.normeZ = math.sqrt ( (xb - xa)^2 + (yb - ya)^2 )]]--

	--calcule la norme de la largeur bar progress 2 point 
	local xB = progress.bar.x + progress.bar.width
	local yB = progress.bar[1].y + progress.bar.height
	progress.norme = math.sqrt( (xB - progress.bar.x)^2 + (yB - progress.bar[1].y)^2 )

end

function love.update()

	-- position x et y de mouse
  	xM, yM = love.mouse.getPosition()

	--calcule la norme du debut de la largeur jusqu'à la souris
	local x1 =  xM
	local y1 = 0
	progress.normeM = math.sqrt( (xM - x1)^2 + (yM - x1)^2 ) 

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

	love.graphics.rectangle("fill", progress.bar.x, progress.bar[1].y, progress.width[1], progress.bar.height)
	love.graphics.rectangle("fill", progress.bar.x, progress.bar[2].y, progress.width[2], progress.bar.height)

end

function love.mousepressed (xM, yM, button)

 	-- progress
	if xM > progress.bar.x and xM < progress.bar.x + progress.bar.width and yM > progress.bar[1].y and yM < progress.bar[1].y + progress.bar.height and button == 1 then
		local pourc = 100*progress.normeM/progress.norme
		print(pourc)
		progress.width[1] = (60*desktopWidth/100) * pourc
	end

	if xM > progress.bar.x and xM < progress.bar.x + progress.bar.width and yM > option.bar[2].y and yM < progress.bar[2].y + progress.bar.height and button == 1 then
		print("bar 2")
	end

end