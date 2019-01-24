# frozen_string_litteral: true

require 'application.rb'

class Router

  def initialize
    @application =  Application.new
  end #ainsi, un "Router.new" lancé par app.rb va créer automatique une instance "@controller"

  def perform #rappelle-toi que l'on fait "Router.new.perform" dans app.rb => après initialize, on définit perform.
    puts "Ain’t nuthin’ like playin’ a fine Tik Tak Toe, Cowboy !"
    while true

      #on affiche le menu
      puts "What do ya wanna do maah partner ?\n"
      puts "T' puh-lay this motherfuckin' game, wrahtes: 'Ah wanna puh-lay this motherfuckin' game !'"
      puts "T' escape, wrahtes: 'Let me git out awf thair !'"
      params = gets.chomp #on attend le choix de l'utilisateur

      case params #en fonction du choix
      when "Ah wanna puh-lay this motherfuckin' game !"
        puts "Ya chose ta puh-lay this game ?! K the-yn let's GITTY-UP !" 
        @application.start_the_game
      when 'Let me git out awf thair !'
        View.escape_the_loop #ce "break" permet de sortir de la boucle while. C'est même la seule façon d'en sortir.
      else
        puts "gqyfugvbowituvhqpztcoqshfgveotw!hcprtl!" #si l'utilisateur saisit une entrée non prévue, il retourne au début du "while true". C'est pour ça que la boucle est infinie: potentiellement, il peut se gourer jusqu'à la fin des temps :)
      end
    end
  end
end
