# weapons class for storing the weapon information as well as the print_weapons method

# weapons array - each weapon is stored as a hash with a level, damage value and cost
# we used an array as it is easiest for iteration and display purposes, and we didn't feel the items were complicated enough to justify a dedicated class and so a hash would work well.
$weapons = [{name: "fists", level: 1, damage: 2, cost: 0}, {name: "iron sword", level: 2, damage: 2, cost: 20}, {name: "chainsword", level: 3, damage: 3, cost: 30}, 
            {name: "power sword", level: 4, damage: 4, cost: 40}, {name: "encarmine axe", level: 5, damage: 5, cost: 50}, 
            {name: "power fist", level: 6, damage: 6, cost: 60}, {name: "thunder hammer", level: 7, damage: 7, cost: 70}, {name: "crozius", level: 8, damage: 8, cost: 80},
            {name: "drach'nyen", level: 9, damage: 9, cost: 90}, {name: "blade of the emperor", level: 10, damage: 10, cost: 100}]

def print_weapons
    count = 0 # count allowing list to show background every second item
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
end