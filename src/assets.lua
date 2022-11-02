local Assets = {
	GAME_TITLE = love.graphics.newImage('assets/game-title.png'),
	BUTTON = love.graphics.newImage('assets/button.png'),
	BUTTON_HOVER = love.graphics.newImage('assets/button-hover.png'),
	WORLD = love.graphics.newImage('assets/world.png'),
	TOWER = love.graphics.newImage('assets/tower.png'),
	CHAR1 = {
		WALKING = love.graphics.newImage('assets/chars/char1/animations/walking-left.png'),
		CARD = love.graphics.newImage('assets/chars/char1/card.png')
	},
	WORLD_DETAIL = love.graphics.newImage('assets/world-detail.png')
}

setmetatable(Assets, {
	__index = function(self, key)
		error(string.format('the assets: "%s" is not set in assets', key))
	end
})

return Assets
