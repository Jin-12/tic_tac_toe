#frozen_string_litteral: true

class View

  def ask_players_name
    puts "What's yo-wr litlle nuh-ame, partner ?"
    print "> "
    player_1 = gets.chomp
    puts "Ya will be thuh fuhrst puh-layer".light_blue
    puts "\nEend ya, how do ya cahwl yourself ?"
    print "> "
    player_2 = gets.chomp
    puts "ya will be thuh second one !".green
    players_hash = {"player_1" => player_1.light_blue,"player_2" => player_2.green}
  end

  def ask_where
    puts "Where do ya wanna puh-lace yo-wr pawn ?(Put it like this : #{"A 1".yellow} or #{"B 3".yellow} (spaces ahr important) .)"
    print "> "
    return gets.chomp
  end

# Message when the player choose an occupied case or writes something in the wrong format
  def wrong_entry
    puts"Ya 'ave ta puh-lay this game ta it's end !!!!!!!\n Okay Imma explain it well for ya : 'Wrong entry, It has to be within the board A to C line and 1 to 3 column. Here's an example = (A 2). It must be separated by a space.'".light_red
  end

# Ending round's message (congratulates the winner or tell there is a draw)
  def done(winner_name_array)
    if winner_name_array.count == 1
      puts "Congratulations, #{winner_name_array[0]}, Ya're not so bad after all .".yellow
    else
      puts "Tie Game... You, #{winner_name_array[0]} and #{winner_name_array[1]} #{"prayin' for me t' properly end it?".yellow}"
    end

  end

  def play_again?
    puts "Wanna play another round son ?"
    puts "#{'yay'.yellow} or #{'nay'.yellow} ?"
    while true
      case gets.chomp
      when "yay"
        return true
      when "nay"
        return false
      else
        puts "What you babblin' about ?".light_red
      end
    end
  end

# Printing the board row by row
  def show_the_board(board)
    cur_row = 0
    board.each do |cur_line|
      (0..2).each do |i|
        # Compose our to_print_row with the correct curent case row, a vertical separator,
        # next case same row, a vertical separator and the last case same row
        puts "#{cur_line[0][i]}|#{cur_line[1][i]}|#{cur_line[2][i]}"
      end
      # And each 3 lines (height of our cases) prints the horizontal separator except the third one
      cur_row < 2 ? (puts "---------|---------|---------") : nil
      cur_row += 1
    end
  end

  def tell_the_player_to_play(cur_player_name)
    puts "That is #{cur_player_name}'s turn ta puh-lay partners ."
  end

  def escape_the_loop
    abort("Tarred awf losin' ?".yellow)
  end
end
