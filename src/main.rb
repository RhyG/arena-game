# main file containing them menu and the victory screen

require 'catpix'
require 'colorize'
require 'artii'
require 'progressbar'
require_relative './player_class'
require_relative './weapons'
require_relative './enemies'

# prints out the available commands
def list_commands
    puts UI_ARROW.light_yellow + " " + "'fight', 'f', or 'battle' to view enemies and fight."
    puts UI_ARROW.light_yellow + " " + "'armoury' or 'a' to go to the armoury."
    puts UI_ARROW.light_yellow + " " + "'stats' to view your current status."
    puts UI_ARROW.light_yellow + " " + "'clear' or 'cls' to clear the screen."
    puts UI_ARROW.light_yellow + " " + "'quit', 'q', or 'exit' to abandon your journey."
end

# main menu, also acts as the home area
def main_menu(player)
    quit = false # boolean used to exit menu loop
    while quit != true # while loop to keep player in menu unless choice is made
        puts
        puts "Type 'commands' for a list of available commands."
        print UI_ARROW.red + " "
        input = gets.chomp.strip.downcase
        puts
        case input # switch statement to go to player menu choice
        when 'fight', 'f', 'battle'
            choose_enemy(player)
        when 'armoury', 'a'
            armoury(player)
        when 'stats'
            player.view_stats
        when 'commands'
            list_commands
        when 'clear', 'cls' 
            system 'clear'
        when 'quit', 'q', 'exit'
            abort("Look, bud. You leave now and you forfeit your body count!".red)
        when 'godmode'
            player.level = 100
            player.coins = 5000
        else
            puts "That's not an available command"
        end
    end
end

# victory screen message that displays an image once all 10 champions have been beaten
def victory_screen
    system 'clear'
    'GAME OVER'
    Catpix::print_image "victory_screen.jpg",
    :limit_x => 1.0,
    :limit_y => 0,
    :center_x => true,
    :center_y => true,
    :bg => "white",
    :bg_fill => true
        abort("See you next time.".red)
end
