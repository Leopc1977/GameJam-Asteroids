-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')
-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")
-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

function love.load ()
  
-- récupère height/width fullscreen
  desktopWidth, desktopHeight = love.window.getDesktopDimensions( display )

--LOAD
  love.window.setTitle( "Asteroids" )
  love.window.setFullscreen(true)
  
  backgroundSpace = {}
  --load table background

  -- background
  backgroundSpace.background = {}

  --particule
  backgroundSpace.particule = {}

  --saturne
  backgroundSpace.saturne = {}

  --twinPlanet
  backgroundSpace.twinPlanet = {}

  --bigPlanet
  backgroundSpace.bigPlanet = {}


--load img backgroundS
  backgroundSpace.background.img = love.graphics.newImage("images/background/parallax-space-backgound.png")
  backgroundSpace.particule.img = love.graphics.newImage("images/background/parallax-space-stars.png")
  backgroundSpace.saturne.img  = love.graphics.newImage("images/background/parallax-space-ring-planet.png")
  backgroundSpace.twinPlanet.img  = love.graphics.newImage("images/background/parallax-space-far-planets.png")
  backgroundSpace.bigPlanet.img  = love.graphics.newImage("images/background/parallax-space-big-planet.png")

-- récupere --paramètres-- de particule
 	 backgroundSpace.particule.x = desktopWidth/2 --backgroundSpace.bigPlanet.x
  	backgroundSpace.particule.y = desktopHeight/2 --backgroundSpace.bigPlanet.y
	backgroundSpace.particule.height = backgroundSpace.particule.img:getHeight()
	backgroundSpace.particule.width = backgroundSpace.particule.img:getWidth()
	backgroundSpace.particule.rotation = 0

-- recupere --paramètres-- de saturne
	backgroundSpace.saturne.x = desktopWidth/2
	backgroundSpace.saturne.y = desktopHeight/2
	backgroundSpace.saturne.height = backgroundSpace.saturne.img:getHeight()
	backgroundSpace.saturne.width = backgroundSpace.saturne.img:getWidth()

-- recupere --paramètres-- de twinPlanet
	backgroundSpace.twinPlanet.x = desktopWidth/2
	backgroundSpace.twinPlanet.y = desktopHeight/2
	backgroundSpace.twinPlanet.height = backgroundSpace.twinPlanet.img:getHeight()
	backgroundSpace.twinPlanet.width = backgroundSpace.twinPlanet.img:getWidth()

-- recupere --paramètres-- de bigPlanet
	backgroundSpace.bigPlanet.x = desktopWidth/2
	backgroundSpace.bigPlanet.y = desktopHeight/2
	backgroundSpace.bigPlanet.height = backgroundSpace.bigPlanet.img:getHeight()
	backgroundSpace.bigPlanet.width = backgroundSpace.bigPlanet.img:getWidth()

-- récupère --paramètres-- de background
	backgroundSpace.background.height = backgroundSpace.background.img:getHeight()
	backgroundSpace.background.width = backgroundSpace.background.img:getWidth()
	backgroundSpace.background.x = desktopWidth/2
	backgroundSpace.background.y = desktopHeight

-- convertit image -> fullscreen
	backgroundSpace.scaleX = desktopWidth / backgroundSpace.background.width
	backgroundSpace.scaleY = desktopWidth / backgroundSpace.background.height
	-- scale bigPlanet
	backgroundSpace.bigPlanet.multiplicateX = 4
	backgroundSpace.bigPlanet.multiplicateY = 5.5
	backgroundSpace.bigPlanet.scaleX = (desktopWidth / backgroundSpace.background.width)/backgroundSpace.bigPlanet.multiplicateX
	backgroundSpace.bigPlanet.scaleY = (desktopWidth / backgroundSpace.background.height)/backgroundSpace.bigPlanet.multiplicateY

--timer
timer = 0
tempLimit = 1
chrono = 0
end

function love.update (dt)

--timer

  timer = timer + dt

  if timer >= tempLimit then 
  	timer = 0
  end

--animation 
	--particule
	backgroundSpace.particule.x = backgroundSpace.particule.x + 50 * dt
	backgroundSpace.particule.y = backgroundSpace.particule.y + 50 * dt

	--if love.keyboard.isDown("r") then
	--    backgroundSpace.particule.x = desktopWidth/2 
	--  	backgroundSpace.particule.y = desktopHeight/2
	--end

	--bigPlanet
	if chrono == 0 then
	 --if love.keyboard.isDown("a") then
	 	backgroundSpace.particule.rotation = backgroundSpace.particule.rotation + 1
		backgroundSpace.bigPlanet.scaleX = backgroundSpace.bigPlanet.scaleX + 0.01
		backgroundSpace.bigPlanet.scaleY = backgroundSpace.bigPlanet.scaleY + 0.01
	end
	if love.keyboard.isDown("a") then
		backgroundSpace.bigPlanet.scaleX = (desktopWidth / backgroundSpace.background.width)/backgroundSpace.bigPlanet.multiplicateX
		backgroundSpace.bigPlanet.scaleY = (desktopWidth / backgroundSpace.background.height)/backgroundSpace.bigPlanet.multiplicateY
	end
end

function love.draw ()

--Background inGame

  love.graphics.draw(backgroundSpace.background.img, backgroundSpace.background.x,backgroundSpace.background.y,0,backgroundSpace.scaleX,backgroundSpace.scaleY,backgroundSpace.background.width/2,backgroundSpace.background.height)

  --twinPlanet
  love.graphics.draw(backgroundSpace.twinPlanet.img , backgroundSpace.twinPlanet.x, backgroundSpace.twinPlanet.y,0,backgroundSpace.scaleX,backgroundSpace.scaleY/2, backgroundSpace.twinPlanet.width/2, backgroundSpace.twinPlanet.height/2)
  --saturne
  love.graphics.draw(backgroundSpace.saturne.img, backgroundSpace.saturne.x, backgroundSpace.twinPlanet.y,0, backgroundSpace.scaleX/2, backgroundSpace.scaleY/3, backgroundSpace.saturne.width/2, backgroundSpace.saturne.height/2)

  --particule
  love.graphics.draw(backgroundSpace.particule.img ,backgroundSpace.particule.x,backgroundSpace.particule.y,0,backgroundSpace.scaleX/3,backgroundSpace.scaleY/3,backgroundSpace.particule.width/2,backgroundSpace.particule.height/2)

  --bigPlanet
  love.graphics.draw(backgroundSpace.bigPlanet.img, backgroundSpace.bigPlanet.x, backgroundSpace.bigPlanet.y,0, backgroundSpace.bigPlanet.scaleX, backgroundSpace.bigPlanet.scaleY, backgroundSpace.bigPlanet.width/2, backgroundSpace.bigPlanet.height/2)

end	