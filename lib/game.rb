# frozen_string_litteral: true
require 'view'
require 'board.rb'
class Game

  def initialize(player_1,player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def play_a_round(view, board)
    unless Check.end?(board) do
    puts ""
    view.show_the_board(board)
    while true
      Board.valid_pos?(view.ask_where?) ? puts "valid" : view.wrong_entry


    end

# #le joueur joue
# #on enregistre le tour
    end
  end

end
