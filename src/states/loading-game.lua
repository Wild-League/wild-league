local Deck = require('src.entities.deck')
local Udp = require('src.network.udp')

local LoadingGame = {
	state = 'loading'
}

function LoadingGame:load()
	love.thread.newThread(
		[[
			local DeckApi = require('src.api.deck')

			-- TODO: get user selected deck
			local cards = DeckApi:get_cards('2')

			love.thread.getChannel('cards'):push(cards)
			love.thread.getChannel('state'):push('ready')
		]]
	):start()
end

function LoadingGame:update()
	local cards = love.thread.getChannel('cards'):pop()

	if cards then
		Deck.deck_selected = cards
	end

	if love.thread.getChannel('state'):pop() then
		self.state = love.thread.getChannel('state'):pop()
		CONTEXT:change('game')
	end
end

function LoadingGame:draw()
	if self.state == 'loading' then
		love.graphics.print('Loading ...', 10, 10)
	end
end

function LoadingGame:resize()

end

return LoadingGame
