# weapons class for storing the weapon information as well as the print_weapons method

# get_weapons method used to pass the weapons array to any other method requiring it
def get_weapons
    weapons = [{name: "fists", level: 1, damage: 2, cost: 0}, {name: "iron sword", level: 2, damage: 2, cost: 20}, {name: "chainsword", level: 3, damage: 3, cost: 30}, 
        {name: "power sword", level: 4, damage: 4, cost: 40}, {name: "war axe", level: 5, damage: 5, cost: 50}, 
        {name: "power fist", level: 6, damage: 6, cost: 60}, {name: "mega hammer", level: 7, damage: 7, cost: 70}, {name: "crozius", level: 8, damage: 8, cost: 80},
        {name: "traffic cone", level: 9, damage: 9, cost: 90}, {name: "great sword", level: 10, damage: 10, cost: 100}]
        return weapons
    end

# print_weapons method used to display the list of weapons
    def print_weapons
    count = 0 # count allowing list to show background every second item
    weapons = get_weapons
    weapons.each do |weapon| # iterates through array for display purposes. Gives every second weapon a white background.
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

# armoury method used to display weapons to the player and allow them to purchase them
def armoury(player)
    puts "We've got the weapons, if you've got the coin."
    puts "You currently have " + "#{player.coins} coins.".yellow
    puts
    print_weapons # calls print weapons method from weapons file
    puts
    puts "What are you walking out with today?"
    print UI_ARROW.red + " " 
    user_armoury_choice = gets.chomp.downcase
    weapons = get_weapons
    weapons.each do |weapon|
        if user_armoury_choice == weapon[:name] && player.coins >= weapon[:cost] && player.level >= weapon[:level] # if user is a high enough level and has enough coins allows them to purchase weapon
            dialogue_choice = rand(1...3) # used to select a different dialogue whenever purchasing a weapon
            if dialogue_choice == 1
                puts "That's a good piece, you've chosen well."
            elsif dialogue_choice == 2
                puts "I can already picture your enemy's guts all over it."
            else 
                puts "Used to own one of those myself, lost it in some chump's brain pan."
            end
            puts "#{weapon[:cost]} coins was subtracted from your coin pile." 
            player.weapon = weapon # assigns weapon to player
            player.coins -= weapon[:cost] # takes weapon cost from player coins
            weapons.delete(weapon) # removes the weapon from the array
        elsif user_armoury_choice == weapon[:name] && player.coins < weapon[:cost] # lets user know if they don't have enough coins
            puts "You can't afford that, how 'bout you come back when you've got the funds?"
        elsif user_armoury_choice == weapon[:name] && player.level < weapon[:level] # lets user know if they aren't a high enough level
            puts "You haven't got the skill for a weapon like that."
        else
            # puts "That's not an option."
        end
    end
    main_menu(player)         
end