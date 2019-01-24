# frozen_string_litteral: true
require 'board.rb'
class Game

  def initialize(player_1,player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def play_a_round(view, board)
    puts "on est passé par play_a_round"
    view.show_the_board(board)
#     while !finished?
# #on lance un nouveau tour
# #on display le tableau
# #le joueur joue
# #on enregistre le tour
#     end
  end
end
