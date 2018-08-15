--initializes variables to be used when the program starts
enemy = {}
enemies_Controller = {}
enemies_Controller.enemies = {}


function love.load()
	player = {}
	player.width = 80
	player.height = 20
	player.x = 0
	player.y = 550
	player.bullets = {}
	player.cooldown = 20 --after 20 ticks or 3 times a second
	player.speed = 10
	player.fire = function()
		if player.cooldown <= 0 then
			player.cooldown = 20
			bullet = {}
			bullet.x = player.x + 35 -- the + 35 shifts the bullet to spit out at the center of the player (width of player 80, divided by 2, minus the offset of the width of the bullet itself which is 5 
			bullet.y = player.y
			bullet.speed = 10
			table.insert(player.bullets, bullet)
		end
	end
  
  
  enemies_Controller:spawnEnemy()
end

function enemies_Controller:spawnEnemy()
  enemy = {}
  enemy.x = 0
	enemy.y = 0
	enemy.bullets = {}
	enemy.cooldown = 20 --after 20 ticks or 3 times a second
	enemy.speed = 10
  table.insert(self.enemies,enemy)
end

function enemy:fire()
  if self.cooldown <= 0 then
			self.cooldown = 20
			bullet = {}
			bullet.x = player.x + 35 -- the + 35 shifts the bullet to spit out at the center of the player (width of player 80, divided by 2, minus the offset of the width of the bullet itself which is 5 ]]
			bullet.y = self.y
			bullet.speed = 10
			table.insert(self.bullets, bullet)
		end
end



function love.update(dt)

	player.cooldown = player.cooldown - 1


	--player moves right when right arrow pressed
	if love.keyboard.isDown("right") then
		player.x = player.x + player.speed


	--player moves left when left arrow pressed
	elseif love.keyboard.isDown("left") then
		player.x = player.x - player.speed
	end


	--player shoots bullet if space is pressed
	if love.keyboard.isDown("space") then
		player.fire()
	end


	--for every bullet on screen, if a bullet goes beyond y = -10 then it will delete the memory in the table
	for i,b in ipairs(player.bullets) do
		if b.y < -10 then
			table.remove(player.bullets, i)
		end
		b.y = b.y - b.speed

	end
end



--if at any point in time the escape key is pressed love 2d will terminate
function love.keypressed(key)
    -- keys can be accessed by string name
    if key == 'escape' then
        -- function LÖVE gives us to terminate application
        love.event.quit()
    end
end



--anything in this draw function will occur every cycle
function love.draw()
	--draw player with cyan
	love.graphics.setColor(0,1,1)
	love.graphics.rectangle("fill",player.x,player.y,player.width,player.height)
  
  for _,e in pairs(enemies_Controller.enemies) do
    love.graphics.rectangle("fill",e.x,e.y,player.width,player.height)
  end
	--draw bullets with white
	love.graphics.setColor(1,1,1)
	for _, b in pairs(player.bullets) do
		love.graphics.rectangle("fill",b.x,b.y,10,10) --bullet 10 x 10
	end
end


