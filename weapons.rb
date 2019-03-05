# weapons array - each weapon is stored as a hash with a level, damage value and cost
# we used this format as an array is easiest for iteration and display purposes, and we didn't feel the items were complicated enough to justify a dedicated class and so a hash would work well.

$weapons = [{name: "fists", level: 1, damage: 2, cost: 0}, {name: "wooden sword", level: 1, damage: 4, cost: 10}, {name: "iron sword", level: 2, damage: 2, cost: 20}, 
            {name: "chainsword", level: 3, damage: 3, cost: 30}, {name: "power sword", level: 4, damage: 4, cost: 40}, {name: "encarmine axe", level: 5, damage: 5, cost: 50}, 
            {name: "power fist", level: 6, damage: 6, cost: 60}, {name: "thunder hammer", level: 7, damage: 7, cost: 70}, {name: "crozius", level: 8, damage: 8, cost: 80},
            {name: "drach'nyen", level: 9, damage: 9, cost: 90}, {name: "Blade of the Emperor", level: 10, damage: 10, cost: 100}]