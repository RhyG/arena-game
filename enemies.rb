# $enemies = [{name: "Priamus", level: 1, health: 10, attack: 1}, {name: "Duoro", level: 2, health: 20, attack: 3}, {name: "Tertius", level: 3, health: 40, attack: 5}, 
#            {name: "Quattrus", level: 4, health: 80, attack: 8}, {name: "Quincetius", level: 5, health: 120, attack: 12}, {name: "Loken", level: 6, health: 150, attack: 15}, 
#            {name: "Abbadon", level: 7, health: 200, attack: 20}, {name: "Erebus", level: 8, health: 250, attack: 28}, {name: "Lorgar", level: 9, health: 350, attack: 50}, 
#            {name: "Warmaster Horus", level: 10, health: 500, attack: 65}]

class Enemy
    attr_reader :name, :level
    attr_writer :is_practice_enemy
    attr_accessor :attack, :health
    def initialize(name, level, health, attack)
        @name = name
        @level = level
        @health = health
        @attack = attack
        #@is_practice_enemy = false
    end
end

#(NAME, LEVEL, HEALTH, ATTACK)

#practice bots
slave_joe = Enemy.new("slavejoe", 1, 5, 1)
#slave_joe.is_practice_enemy = true
unlucky_bob = Enemy.new("unlucky bob", 3, 20, 3)
##unlucky_bob.is_practice_enemy = true
mince = Enemy.new("Mince Meat", 6, 115, 15)
#mince.is_practice_enemy = true
greg = Enemy.new("Greg the Favoured One", 8, 220, 25)
#greg.is_practice_enemy = true

# champions
priamus = Enemy.new("priamus the first son", 1, 10, 2)
duoro = Enemy.new("duoro", 2, 20, 3)
tertius = Enemy.new("tertius", 3, 40, 5)
stan = Enemy.new("stan", 4, 80, 8)
calgar = Enemy.new("calgar", 5, 120, 12)
loken = Enemy.new("loken", 6, 150, 15)
abbadon = Enemy.new("abbadon", 7, 200, 20)
erebus = Enemy.new("erebus", 8, 250, 35)
lorgar = Enemy.new("lorgar", 9, 350, 50)
horus = Enemy.new("joe, the faetill one", 10, 500, 65)

$enemies = [priamus, duoro, tertius, stan, calgar, loken, abbadon, erebus, lorgar, horus]
$practice_drones = [slave_joe, unlucky_bob, mince, greg]