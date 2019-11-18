-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')
-- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
-- Indispensable pour du pixel art
love.graphics.setDefaultFilter("nearest")
-- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
if arg[#arg] == "-debug" then require("mobdebug").start() end

function love.load ()
  
--load
  love.window.setTitle( "Asteroids" )
  love.window.setFullscreen(true)
  
  backgroundSpace = {}
  
  backgroundSpace.particule = {} 

--load background
  backgroundSpace.img = love.graphics.newImage("images/background/parallax-space-backgound.png")
  backgroundSpace.particule = love.graphics.newImage("images/background/parallax-space-stars.png")
-- récupère height/width fullscreen
  deskopWidth, deskopHeight = love.window.getDesktopDimensions( display )
-- récupère height/width de parallax-space-backgound.png
backgroundSpace.height = backgroundSpace.img:getHeight()
backgroundSpace.width = backgroundSpace.img:getWidth()

-- convertit image -> fullscreen
backgroundSpace.scaleX = deskopWidth / backgroundSpace.width
backgroundSpace.scaleY = deskopWidth / backgroundSpace.height

-- load x et y de backgroundSpace.particule
  backgroundSpace.particule.x = deskopWidth/2
  backgroundSpace.particule.y = deskopHeight/2

end 

function love.update (dt)



end

function love.draw ()

--Background inGame
  love.graphics.draw(backgroundSpace.img, deskopWidth/2,deskopHeight,0,backgroundSpace.scaleX,backgroundSpace.scaleY,backgroundSpace.width/2,backgroundSpace.height)
  --particule
  love.graphics.draw(backgroundSpace.particule,backgroundSpace.particule.x,backgroundSpace.particule.y,0,backgroundSpace.scaleX / 2,backgroundSpace.scaleY/2,backgroundSpace.width/2,backgroundSpace.height)
end