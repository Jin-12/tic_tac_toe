#frozen_string_litteral: true

class View

  def ask_players_name
    puts "What's yo-wr litlle nuh-ame, partner ?"
    print "> "
    player_1 = gets.chomp
    puts "Ya will be thuh fuhrst puh-layer"
    puts "eend ya, how do ya cahwl yourself ?"
    puts "> "
    player_2 = gets.chomp
    puts "ya will be thuh second one !"
    players_hash = {"player_1" => player_1,"player_2" => player_2}
  end

  def ask_where
    puts "Where do ya wanna puh-lace yo-wr pawn ?(Put it like this : 'A 1' or 'B 3'.)"
    return gets.chomp
  end

  def wrong_entry
    puts" Okay Imma explain it well for ya : 'Wrong entry, It has to be within the board A to C line and 1 to 3 column. Here's an example = (A 2). It must be separated by a space.'"
  end

  def done(winner_name)
    if !!winner_name
      puts "Congratulations,#{winner_name}, Ya're not so bad after all ."
    else
      puts "Tie Game... Wanna leave it at that ?"
    end

  end

  def play_again?
    puts "Wanna play another round son ?"
    puts "yay or nay ?"
    while true
      case gets.chomp
      when "yay"
        return true
      when "nay"
        return false
      else
        puts "What you babblin' about ?"
      end
    end
  end

  def show_the_board(board)
    ibis = 0
    board.each do |cur_line|
      (0..2).each do |i|
        puts "#{cur_line[0][i]}|#{cur_line[1][i]}|#{cur_line[2][i]}"
      end
      ibis < 2 ? (puts "---------|---------|---------") : nil
      ibis += 1
    end
  end

  def tell_the_player_to_play(cur_player_name)
    puts "That is #{cur_player_name}'s turn ta puh-lay partners ."
  end

  def escape_the_loop
    abort("Tarred awf losin' ?")
  end
end
