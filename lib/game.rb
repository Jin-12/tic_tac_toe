# frozen_string_litteral: true

require 'view.rb'
require 'board.rb'
class Game

  def initialize(player_1,player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

  def play_a_round(view, board_instance)
    round_number = 0
    while board_instance.end? == 0
      puts ""
      cur_player = round_number % 2
      cur_player_name = (cur_player == 0 ? @player_1 : @player_2)
      view.show_the_board(board_instance.return_board)
      view.tell_the_player_to_play(cur_player_name)
      while true
        pawn_pos = view.ask_where
        board_instance.valid_pos?(pawn_pos) ? break : view.wrong_entry
      end
      board_instance.board_update(pawn_pos, cur_player)
      round_number += 1
    end
    view.show_the_board(board_instance.return_board)
    board_instance.end? == 1 ? view.done([cur_player_name]) : view.done([@player_1, @player_2])
  end
end
