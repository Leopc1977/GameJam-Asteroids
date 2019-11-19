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

-- récupere --paramètres-- de backgroundSpace.particule
 	 backgroundSpace.particule.x = desktopWidth/2
  	backgroundSpace.particule.y = desktopHeight/2
	backgroundSpace.particule.height = backgroundSpace.particule.img:getHeight()
	backgroundSpace.particule.width = backgroundSpace.particule.img:getWidth()

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

	--backgroundSpace.bigPlanet.y =
	--backgroundSpace.bigPlanet.y =

-- récupère --paramètres-- de parallax-space-backgound
	backgroundSpace.background.height = backgroundSpace.background.img:getHeight()
	backgroundSpace.background.width = backgroundSpace.background.img:getWidth()

-- convertit image -> fullscreen
	backgroundSpace.scaleX = desktopWidth / backgroundSpace.background.width
	backgroundSpace.scaleY = desktopWidth / backgroundSpace.background.height

end

function love.update (dt)



end

function love.draw ()

--Background inGame

  love.graphics.draw(backgroundSpace.background.img, desktopWidth/2,desktopHeight,0,backgroundSpace.scaleX,backgroundSpace.scaleY,backgroundSpace.background.width/2,backgroundSpace.background.height)
  --particule
  love.graphics.draw(backgroundSpace.particule.img ,backgroundSpace.particule.x,backgroundSpace.particule.y,0,backgroundSpace.scaleX /4,backgroundSpace.scaleY/4,backgroundSpace.particule.width/2,backgroundSpace.particule.height)
  --twinPlanet
  love.graphics.draw(backgroundSpace.twinPlanet.img , backgroundSpace.twinPlanet.x, backgroundSpace.twinPlanet.y,0,backgroundSpace.scaleX,backgroundSpace.scaleY/2, backgroundSpace.twinPlanet.width/2, backgroundSpace.twinPlanet.height/2)
  --saturne
  love.graphics.draw(backgroundSpace.saturne.img, backgroundSpace.saturne.x, backgroundSpace.twinPlanet.y,0, backgroundSpace.scaleX/2, backgroundSpace.scaleY/3, backgroundSpace.saturne.width/2, backgroundSpace.saturne.height/2)

end	