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
	backgroundSpace.rotation = 0

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
	backgroundSpace.bigPlanet.scaleXLimit = 8.3547058823528
	backgroundSpace.bigPlanet.scaleYLimit = 8.771818181818
	-- scale particule
	backgroundSpace.particule.scaleX = desktopWidth / backgroundSpace.background.width
	backgroundSpace.particule.scaleY = desktopWidth / backgroundSpace.background.height
	backgroundSpace.particule.scaleXLimit = 13.648823529412
	backgroundSpace.particule.scaleYLimit = 18.59
--timer
timer = 0
tempLimit = 1
chrono = 0
end

-- round -> nb d'ennemie
wave = {}
wave[1] = 1
wave[2] = 2
wave[3] = 3
wave[4] = 4
wave[5] = 5

--test 
condStop = false

function love.update (dt)

--timer

  timer = timer + dt

  if timer >= tempLimit then 
  	timer = 0
  end

--animation 

	--rotation des particule
	backgroundSpace.rotation = backgroundSpace.rotation + 0.005
	if backgroundSpace.bigPlanet.scaleX < backgroundSpace.bigPlanet.scaleXLimit and backgroundSpace.bigPlanet.scaleY < backgroundSpace.bigPlanet.scaleYLimit and backgroundSpace.particule.scaleX < backgroundSpace.particule.scaleXLimit and backgroundSpace.particule.scaleY < backgroundSpace.particule.scaleYLimit then
		if chrono == 0 then
		 	--bigPlanet scale
			backgroundSpace.bigPlanet.scaleX = backgroundSpace.bigPlanet.scaleX + 0.001
			backgroundSpace.bigPlanet.scaleY = backgroundSpace.bigPlanet.scaleY + 0.001
			--particule scale
			backgroundSpace.particule.scaleX = backgroundSpace.particule.scaleX + 0.001
			backgroundSpace.particule.scaleY = backgroundSpace.particule.scaleY + 0.001
		end
	end
	-- test reset scale bigPlanet
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

  --particule
  love.graphics.draw(backgroundSpace.particule.img ,backgroundSpace.particule.x,backgroundSpace.particule.y,backgroundSpace.rotation,backgroundSpace.particule.scaleX/3,backgroundSpace.particule.scaleY/3,backgroundSpace.particule.width/2,backgroundSpace.particule.height/2)

  --bigPlanet
  love.graphics.draw(backgroundSpace.bigPlanet.img, backgroundSpace.bigPlanet.x, backgroundSpace.bigPlanet.y,backgroundSpace.rotation, backgroundSpace.bigPlanet.scaleX, backgroundSpace.bigPlanet.scaleY, backgroundSpace.bigPlanet.width/2, backgroundSpace.bigPlanet.height/2)

end	