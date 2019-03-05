require_relative './enemies'
require_relative './weapons'
require 'catpix'
require 'colorize'
require 'artii'
require 'progressbar'

class Player
    attr_reader :name
    attr_accessor :attack, :weapon, :level, :coins, :experience

    # initalizes the player with base stats
    def initialize(name)
        @name = name
        @level = 1
        @health = 5
        @weapon = $weapons[0]
        @wins = 0
        @coins = 0
        @experience = 0
    end

    # fight method for actual combat between player and chosen enemy
    def fight(enemy)
        stored_health = enemy.health # stores the enemy health in a variable
        5.times do # this generates a random number between 1 and the damage value of the equipped weapon, then takes that from the enemy health
            damage = (rand(1..self.weapon[:damage])) * self.level
            #puts "Dealt: #{damage} damage."
            enemy.health -= damage # subtracts the damage from the enemy health
        end

        bar = ProgressBar.create(:title => "Fighting") # this creates a progress bar that 'simulates' the fight
        30.times { bar.increment; sleep 0.07 }

        if enemy.health <= 0 # if the enemy health is brought to zero or less then the player wins
            puts
            puts "VICTORY!".green
            # if loop to check if the enemy was a champion or practice drone which changes how much experience and gold is awarded
            if $enemies.include? enemy
                $coins_rewarded = 10 * enemy.level 
                puts "The Tetrarchs award you " + "#{$coins_rewarded} coins".yellow + " for your efforts." 
                puts
                self.level_up(5) # calls the level up method and passes it 'experience'
                $enemies.delete(enemy) # deletes the champion from the array
                victory_screen if $enemies.length == 0
            elsif $practice_drones.include? enemy 
                $coins_rewarded = 5 # * (0.5 * enemy.level)
                puts "The Tetrarchs award you" + " #{$coins_rewarded} coins".yellow + " for your efforts."
                exp = 2 * (enemy.level * 0.5)
                self.level_up(2) # calls the level up method and passes it 'experience'
            else
            end
            self.coins += $coins_rewarded # adds the coins to the player
            
            enemy.health = stored_health if $practice_drones.include? enemy # restores the practice drone health so that you can train against them over and over
        else # executes if enemy health isn't brought to zero
            puts "You lose.".red
            puts "The Tetrarchs throw two coins at your feet."
            self.coins += 2
            enemy.health = stored_health # restores champion health so next fight isn't easier
            main_menu(self)    
        end
        main_menu(self) 
    end

    # level up method to receive experience and increase player level whenever experience hits 10
    def level_up(exp)
        self.experience += exp
        self.experience
        if self.experience >= 10
            self.level += 1
            puts "You have reached level #{self.level}."
            self.experience = 0 # restore experience to zero on each level up
        end
    end

    # view stats method for printing the player stats, good for testing purposes
    def view_stats
        puts "Name: #{self.name}"
        puts "Level: #{self.level}"
        puts "Coins: #{self.coins}"
        puts "Weapon: #{self.weapon[:name]}"
        #puts "Experience: #{self.experience}"
    end

    # armoury method used to display weapons to the player and allow them to purchase them
    def armoury
        count = 0 # count allowing list to show background every second item
        puts "We've got the weapons, if you've got the coin."
        puts "You currently have " + "#{self.coins} coins.".yellow
        puts
        $weapons.each do |weapon| # iterates through array for display purposes. Gives every second weapon a white background.
            if count % 2 == 0
                puts "Weapon: #{weapon[:name].capitalize} - Damage: #{weapon[:damage]} - Level: #{weapon[:level]} - Cost: #{weapon[:cost]}".black.on_white
            elsif weapon[:level] == 10
                puts "Weapon: #{weapon[:name].capitalize} - Damage: #{weapon[:damage]} - Level: #{weapon[:level]} - Cost: #{weapon[:cost]}".yellow
            else
                puts "Weapon: #{weapon[:name].capitalize} - Damage: #{weapon[:damage]} - Level: #{weapon[:level]} - Cost: #{weapon[:cost]}"
            end
            count += 1
        end
        puts
        puts "What are you walking out with today?"
        print UI_ARROW.red + " " 
        user_armoury_choice = gets.chomp.downcase
        puts

        $weapons.each do |weapon|
            if user_armoury_choice == weapon[:name] && self.coins >= weapon[:cost] && self.level >= weapon[:level] # if user is a high enough level and has enough coins allows them to purchase weapon
                dialogue_choice = rand(1...3) # used to select a different dialogue whenever purchasing a weapon
                if dialogue_choice == 1
                    puts "That's a good piece, you've chosen well."
                elsif dialogue_choice == 2
                    puts "I can already picture your enemy's guts all over it."
                else 
                    puts "Used to own one of those myself, lost it in some chump's brain pan."
                end
                puts "#{weapon[:cost]} coins was subtracted from your coin pile." 
                self.weapon = weapon # assigns weapon to player
                self.coins -= weapon[:cost] # takes weapon cost from player coins
                $weapons.delete(weapon) # removes the weapon from the array
            elsif user_armoury_choice == weapon[:name] && self.coins < weapon[:cost] # lets user know if they don't have enough coins
                puts "You can't afford that, how 'bout you come back when you've got the funds?"
            elsif user_armoury_choice == weapon[:name] && self.level < weapon[:level] # lets user know if they aren't a high enough level
                puts "You haven't got the skill for a weapon like that."
            else
                # puts "That's not an option."
            end
        end
        if ! $weapons.include? user_armoury_choice
            puts "That isn't an option."
        end
        main_menu(self)         
    end

    # choose enemy method used to display enemies, allow user to choose and fight an enemy
    def choose_enemy
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
        enemy_choice = gets.chomp.downcase
       
        enemy_found = false # boolean used to exit loop if an enemy is chosen

        while enemy_found != true # while loop to display enemies if enemy_found is false
            $enemies.each do |enemy| # prints the 'champions'
                if enemy.name.include? enemy_choice
                    puts "Entering the arena"
                    self.fight(enemy) # calls fight method and passes the chosen enemy
                    enemy_found = true # sets enemy_found to true and exits the while loop
                end
            end
            $practice_drones.each do |practice_drone| # prints the 'practice drones'
                if practice_drone.name.include? enemy_choice # checks to see if user entered the correct name of an enemy
                    puts "Entering the training cages"
                    self.fight(practice_drone) # calls fight method and passes the chosen enemy
                    enemy_found = true # sets enemy_found to true and exits the while loop
                end
            end
            enemy_found = true # sets enemy_found to true and exits the while loop
        end
        main_menu(self)
    end
end

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

