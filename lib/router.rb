# frozen_string_litteral: true

require 'application.rb'

class Router

  def initialize
    @application =  Application.new
  end

  def perform
    puts "Ain’t nuthin’ like playin’ a fine Tik Tak Toe, Cowboy !"
    # Infinite menu loop to launch the game or exit the program
    while true
      puts "\n\nWhat do ya wanna do maah partner ?"
      puts "\nT' puh-lay this motherfuckin' game, wrahtes: #{"Ah wanna puh-lay this motherfuckin' game !".yellow}"
      puts "T' escape, wrahtes: #{"Let me git out awf thair !".yellow}"
      print "> "
      params = gets.chomp

      case params
      when "Ah wanna puh-lay this motherfuckin' game !"
        puts "\n\nYa chose ta puh-lay this game ?! K the-yn let's GITTY-UP !" 
        @application.start_the_game
      when 'Let me git out awf thair !'
        @application.escape_the_loop
      else
        puts "\n\nYa 'ave ta speak like me babe".light_red
      end
    end
  end
end
