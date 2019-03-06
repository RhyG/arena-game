# this is the launch file of the app from which other files are called

require_relative './player_class'
require_relative './weapons'
require_relative './main'

system 'clear'

# prints title card
a = Artii::Base.new
puts"                         WELCOME TO"
puts a.asciify("THE  ARENA").black.on_white

UI_ARROW = "\u2712"
print UI_ARROW.light_yellow
puts " What is the name of your champion?"
player = Player.new(gets.chomp) # creates new instance of player class with name entered by users
puts UI_ARROW.light_yellow + " welcome to the arena, #{player.name}"

main_menu(player)