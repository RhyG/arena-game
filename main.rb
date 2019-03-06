require 'catpix'
require 'colorize'
require 'artii'
require 'progressbar'

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
