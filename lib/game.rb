# frozen_string_litteral: true

require 'view.rb'
require 'board.rb'

class Game
  def initialize(player_1,player_2)
    @player_1 = player_1
    @player_2 = player_2
  end

# Real business happens here for each round, launch the turns while round is not ended
  def play_a_round(view, board_instance)
    round_number = 0
    while board_instance.end? == 0
      puts ""
      # Alternates the current players with the number of round done
      cur_player = round_number % 2
      cur_player_name = (cur_player == 0 ? @player_1 : @player_2)
      # First display the board at each turn
      view.show_the_board(board_instance.return_board)
      view.tell_the_player_to_play(cur_player_name)
      # Infinite loop to ask where the player actualy wanna play
      while true
        pawn_pos = view.ask_where
        board_instance.valid_pos?(pawn_pos) ? break : view.wrong_entry
      end
      board_instance.board_update(pawn_pos, cur_player)
      round_number += 1
    end
    # Display the final board before calling for the round's end message
    view.show_the_board(board_instance.return_board)
    # Calling round's end message with winner name or both for a ties
    board_instance.end? == 1 ? view.done([cur_player_name]) : view.done([@player_1, @player_2])
  end
end
