class Enemy
    attr_reader :name, :level
    attr_writer :is_practice_enemy
    attr_accessor :attack, :health
    def initialize(name, level, health, attack)
        @name = name
        @level = level
        @health = health
        @attack = attack
    end
end

#(NAME, LEVEL, HEALTH, ATTACK)
#practice bots
slave_joe = Enemy.new("slave dan", 1, 5, 1)
unlucky_bob = Enemy.new("unlucky bob", 3, 20, 3)
mince = Enemy.new("Mince Meat", 6, 115, 15)
greg = Enemy.new("Greg the Favoured One", 8, 220, 25)

# champions
priamus = Enemy.new("priamus the first son", 1, 10, 2)
duoro = Enemy.new("twocius", 2, 20, 3)
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