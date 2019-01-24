# frozen_string_litteral: true

require 'view'
require 'board.rb'
class Game

  def initialize(player_1,player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def play_a_round(view, board)
    unless board.end?
      puts ""
      view.show_the_board(board.return_board)
      while true
        Board.valid_pos?(view.ask_where?) ? (puts "valid") : view.wrong_entry
    end
  end
end
end
