# frozen_string_litteral: true

require 'board.rb'
require 'game.rb'
require 'view.rb'

class Application

	def initialize
		@view = View.new
	end

	def start_the_game
		params = @view.ask_players_name
		game = Game.new(params['player_1'], params['player_2'])
		game.play_a_round(@view, Board.new)
		while true
			@view.play_again? ? game.play_a_round(@view, Board.new) : @view.escape_the_loop# onsort de la partie avec un petit message de fils de pute
		end
	end
end
