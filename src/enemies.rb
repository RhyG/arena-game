# this file holds the enemy class as well as the methods used to print the list of enemies and choose an enemy and decide a winner when fighting

# enemy class used to define the enemies and their characteristics
class Enemy
    attr_reader :name, :is_practice_enemy
    attr_accessor :attack, :health, :level
    def initialize(name, level, health, is_practice_enemy)
        @name = name # enemy name
        @level = level # enemy level
        @health = health # enemy health
        @is_practice_enemy = is_practice_enemy # boolean used to check if the enemy is a champion or practice bot
    end
end

# (NAME, LEVEL, HEALTH, is_practice_enemy)
# practice bots
slave_joe = Enemy.new("slave dan", 1, 5, true)
unlucky_bob = Enemy.new("unlucky bob", 3, 20, true)
mince = Enemy.new("mince meat", 6, 115, true)
greg = Enemy.new("greg the strongest weakling", 8, 220, true)

# champions
priamus = Enemy.new("priamus", 1, 10, false)
duoro = Enemy.new("road warrior hawk", 2, 20, false)
tertius = Enemy.new("tertius", 3, 40, false)
stan = Enemy.new("honky tonk man", 4, 80, false)
calgar = Enemy.new("calgar", 5, 120, false)
loken = Enemy.new("loken", 6, 150, false)
abbadon = Enemy.new("junkyard dog", 7, 200, false)
erebus = Enemy.new("erebus", 8, 250, false)
lorgar = Enemy.new("dayman", 9, 350, false)
horus = Enemy.new("joe, the faetill one", 10, 400, false)

# arrays containing each enemy - didn't want to use global but ran out of time
$enemies = [priamus, duoro, tertius, stan, calgar, loken, abbadon, erebus, lorgar, horus]
$practice_drones = [slave_joe, unlucky_bob, mince, greg]

# print enemies method used to display a list of enemies
def print_enemies(player)
    puts "CHOOSE YOUR ADVERSARY.".black.on_white 
    puts
    puts "Train your skills against the practice drones: ".green
    puts "------------------------------------------------"
    $practice_drones.each do |practice_drone| # used for display reasons, prints every second enemy on a white background
        if practice_drone.level < player.level + 4
            puts "#{practice_drone.name.capitalize} - level: #{practice_drone.level}" #if (practice_drone.level < self.level + 4)
            puts "------------------------------------------------"
        end
    end 
    puts
    puts "Test your luck against the champions:".green
    puts "------------------------------------------------"
    $enemies.each do |enemy|
        if enemy.level < player.level + 4
            puts "#{enemy.name.capitalize} - level: #{enemy.level}"
            puts "------------------------------------------------"
        end
    end
end

# choose enemy method used to display enemies, allow user to choose and fight an enemy
def choose_enemy(player)
    print_enemies(player)
    puts
    puts "Who is it gonna be?"
    print UI_ARROW.red + " "
    enemy_choice = gets.chomp.downcase
    enemy_found = false # boolean used to exit loop if an enemy is chosen
    while enemy_found != true # while loop to display enemies if enemy_found is false
        $enemies.each do |enemy| # prints the 'champions'
            if enemy.name.include? enemy_choice
                puts "Entering the arena"
                player.fight(enemy) # calls fight method and passes the chosen enemy
                enemy_found = true # sets enemy_found to true and exits the while loop
            end
        end
        $practice_drones.each do |practice_drone| # prints the 'practice drones'
            if practice_drone.name.include? enemy_choice # checks to see if user entered the correct name of an enemy
                puts "Entering the training cages"
                player.fight(practice_drone) # calls fight method and passes the chosen enemy
                enemy_found = true # sets enemy_found to true and exits the while loop
            end
        end
        enemy_found = true # sets enemy_found to true and exits the while loop
    end
    main_menu(player)
end

# the decide_winner method is passed the enemy and their health and prints the appropriate information depending on who the winner of the fight is. It also gives the player coins and exp
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