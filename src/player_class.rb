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
            puts
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
end