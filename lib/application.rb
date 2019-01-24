# frozen_string_litteral: true

require 'board.rb'
require 'game.rb'
require 'view.rb'

# Thi is our "controller" initializing the view and calling the rounds instances with fresh 
# boards each time players wanna continue
class Application

	def initialize
		@view = View.new
	end

	def start_the_game
		params = @view.ask_players_name
		# Create the game_instance with players names
		game = Game.new(params['player_1'], params['player_2'])
		# Launch the first round
		game.play_a_round(@view, Board.new)
		while true
			# Litle loop to reload a fresh round is players want to continue
			@view.play_again? ? game.play_a_round(@view, Board.new) : escape_the_loop
		end
	end

	def escape_the_loop
		@view.escape_the_loop
	end
end
