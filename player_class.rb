# this file contains the player class and the bulk of the methods called by the player

require_relative './enemies'
require_relative './weapons'
require_relative './main'

class Player
    attr_reader :name
    attr_accessor :attack, :weapon, :level, :coins, :experience

    # initalizes the player with base stats
    def initialize(name)
        @name = name
        @level = 1
        @health = 5
        @weapon = get_weapons[0]
        @wins = 0
        @coins = 0
        @experience = 0
    end

    # fight method for actual combat between player and chosen enemy
    def fight(enemy)
        stored_health = enemy.health # stores the enemy health in a variable
        5.times do # this generates a random number between 1 and the damage value of the equipped weapon, then takes that from the enemy health
            damage = (rand(1..self.weapon[:damage])) * self.level
            enemy.health -= damage # subtracts the damage from the enemy health
        end
        decide_winner(enemy, stored_health) # calls decide winner method in emenies.rb file to decide on a winner
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
        puts "Experience: #{self.experience}"
    end

    # armoury method used to display weapons to the player and allow them to purchase them
    def armoury
        puts "We've got the weapons, if you've got the coin."
        puts "You currently have " + "#{self.coins} coins.".yellow
        puts
        print_weapons # calls print weapons method from weapons file
        puts
        puts "What are you walking out with today?"
        print UI_ARROW.red + " " 
        user_armoury_choice = gets.chomp.downcase
        weapons = get_weapons
        weapons.each do |weapon|
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
                weapons.delete(weapon) # removes the weapon from the array
            elsif user_armoury_choice == weapon[:name] && self.coins < weapon[:cost] # lets user know if they don't have enough coins
                puts "You can't afford that, how 'bout you come back when you've got the funds?"
            elsif user_armoury_choice == weapon[:name] && self.level < weapon[:level] # lets user know if they aren't a high enough level
                puts "You haven't got the skill for a weapon like that."
            else
                # puts "That's not an option."
            end
        end
        main_menu(self)         
    end

    # choose enemy method used to display enemies, allow user to choose and fight an enemy
    def choose_enemy
        print_enemies
        puts
        puts "Who is it gonna be?"
        print UI_ARROW.red + " "
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