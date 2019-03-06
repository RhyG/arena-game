            # puts
            # puts "VICTORY!".green
            # # if loop to check if the enemy was a champion or practice drone which changes how much experience and gold is awarded
            # if $enemies.include? enemy
            #     $coins_rewarded = 10 * enemy.level 
            #     puts "The Tetrarchs award you " + "#{$coins_rewarded} coins".yellow + " for your efforts." 
            #     puts
            #     self.level_up(5) # calls the level up method and passes it 'experience'
            #     $enemies.delete(enemy) # deletes the champion from the array
            #     victory_screen if $enemies.length == 0
            # elsif $practice_drones.include? enemy 
            #     $coins_rewarded = 5 # * (0.5 * enemy.level)
            #     puts "The Tetrarchs award you" + " #{$coins_rewarded} coins".yellow + " for your efforts."
            #     exp = 2 * (enemy.level * 0.5)
            #     self.level_up(2) # calls the level up method and passes it 'experience'
            # else
            # end
            # self.coins += $coins_rewarded # adds the coins to the player