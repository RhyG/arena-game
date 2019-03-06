require 'catpix'

class Enemy
    attr_reader :name, :is_practice_enemy
    #attr_writer :is_practice_enemy
    attr_accessor :attack, :health, :level
    def initialize(name, level, health, is_practice_enemy)
        @name = name
        @level = level
        @health = health
        @is_practice_enemy = is_practice_enemy
    end
end

#(NAME, LEVEL, HEALTH)
#practice bots
slave_joe = Enemy.new("slave dan", 1, 5, true)
unlucky_bob = Enemy.new("unlucky bob", 3, 20, true)
mince = Enemy.new("mince meat", 6, 115, true)
greg = Enemy.new("greg the strongest weakling", 8, 220, true)

# champions
priamus = Enemy.new("priamus the first son", 1, 10, false)
duoro = Enemy.new("twocius", 2, 20, false)
tertius = Enemy.new("tertius", 3, 40, false)
stan = Enemy.new("stan", 4, 80, false)
calgar = Enemy.new("calgar", 5, 120, false)
loken = Enemy.new("loken", 6, 150, false)
abbadon = Enemy.new("abbadon", 7, 200, false)
erebus = Enemy.new("erebus", 8, 250, false)
lorgar = Enemy.new("lorgar", 9, 350, false)
horus = Enemy.new("joe, the faetill one", 10, 400, false)

$enemies = [priamus, duoro, tertius, stan, calgar, loken, abbadon, erebus, lorgar, horus]
$practice_drones = [slave_joe, unlucky_bob, mince, greg]

def print_enemies
    puts "CHOOSE YOUR ADVERSARY.".black.on_white 
    puts
    puts "Train your skills against the practice drones: ".green
    puts "------------------------------------------------"
    $practice_drones.each do |practice_drone| # used for display reasons, prints every second enemy on a white background
        if practice_drone.level < self.level + 4
            puts "#{practice_drone.name.capitalize} - level: #{practice_drone.level}" #if (practice_drone.level < self.level + 4)
            puts "------------------------------------------------"
        end
    end 
    puts
    puts "Test your luck against the champions:".green
    puts "------------------------------------------------"
    $enemies.each do |enemy|
        if enemy.level < self.level + 4
            puts "#{enemy.name.capitalize} - level: #{enemy.level}"
            puts "------------------------------------------------"
        end
    end
    puts
end

def decide_winner(enemy, stored_health)

    bar = ProgressBar.create(:title => "Fighting") # this creates a progress bar that 'simulates' the fight
    30.times { bar.increment; sleep 0.07 }
    coins_rewarded = 0

    if enemy.health <= 0 # if the enemy health is brought to zero or less then the player wins
        puts
        puts "VICTORY!".green
        if ! enemy.is_practice_enemy # check to see if the enemy was a champion or practice enemy and award exp and coins accordingly
            coins_rewarded = 10 * enemy.level
            puts "You are awarded " + "#{coins_rewarded} coins".yellow + " for your efforts."
            puts
            self.level_up(5) # calls the level up method and passes it 'experience'
            $enemies.delete(enemy) # deletes enemy from enemies array
            victory_screen if $enemies.length == 0 # calls the victory screen if all champions are defeated
        elsif enemy.is_practice_enemy 
            coins_rewarded = 5
            puts "You are awarded " + "#{coins_rewarded} coins".yellow + " for your efforts."
            puts
            self.level_up(2)
        else 
            puts "Something went wrong."
        end
        self.coins += coins_rewarded
        enemy.health = stored_health if enemy.is_practice_enemy#$practice_drones.include? enemy # restores the practice drone health so that you can train against them over and over
    else # executes if enemy health isn't brought to zero
        puts "You lose.".red
        puts "The Tetrarchs throw two coins at your feet."
        self.coins += 2
        enemy.health = stored_health # restores champion health so next fight isn't easier
        main_menu(self)    
    end
end