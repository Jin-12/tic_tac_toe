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
    hash_players = {"player_1" => player_1,"player_2" => player_2}
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
  def escape_the_loop
    abort("Tarred awf losin' ?")
  end
end
