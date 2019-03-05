require 'catpix'

class Enemy
    attr_reader :name
    attr_writer :is_practice_enemy
    attr_accessor :attack, :health, :level
    def initialize(name, level, health)
        @name = name
        @level = level
        @health = health
    end
end

#(NAME, LEVEL, HEALTH, ATTACK)
#practice bots
slave_joe = Enemy.new("slave dan", 1, 5)
unlucky_bob = Enemy.new("unlucky bob", 3, 20)
mince = Enemy.new("mince meat", 6, 115)
greg = Enemy.new("greg the strongest weakling", 8, 220)

# champions
priamus = Enemy.new("priamus the first son", 1, 10)
duoro = Enemy.new("twocius", 2, 20)
tertius = Enemy.new("tertius", 3, 40)
stan = Enemy.new("stan", 4, 80)
calgar = Enemy.new("calgar", 5, 120)
loken = Enemy.new("loken", 6, 150)
abbadon = Enemy.new("abbadon", 7, 200)
erebus = Enemy.new("erebus", 8, 250)
lorgar = Enemy.new("lorgar", 9, 350)
horus = Enemy.new("joe, the faetill one", 10, 400)

$enemies = [priamus, duoro, tertius, stan, calgar, loken, abbadon, erebus, lorgar, horus]
$practice_drones = [slave_joe, unlucky_bob, mince, greg]

