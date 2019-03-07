https://github.com/RhyG/arena-game

# The Arena

The Arena is a simple text-based RPG played in the terminal. Players can train to level up, earn coins and buy new weapons with the goal of defeating all 10 champions.

# Requirements

This app requires the following gems:

* colorize
* catpix
* artii
* progressbar

To install the gems run the terminal and type the following for each gem

```ruby
gem install colorize
```

# Functionality

This app works through a number of different methods called from the player class. On launch the user creates a new player and is presented with a list of options. From there they can choose to select enemies and fight.
The winner is determined by calculating a random number between 1 and their current weapon damage. This is then applied to the enemy health until all five rounds are complete. At the end of the five rounds, if the enemy has any health left
the player loses, otherwise they emerge victorious and earn experience and coins.

The player is also able to visit 'the armoury' from which they can view a list of weapons, and if they have enough coin and are a high enough level they can purchase new weapons increasing their damage.

The game ends when all champions have been defeated.

# Instructions for use

To run the app, run the arena.rb file from terminal.

```ruby
ruby arena.rb
```

On launch you will be prompted to give a name to your hero. Once you have done that you can view and choose menu options. There are practice bots you can fight to get started, and when you feel ready you can fight the champions. More champions will be revealed as you level up.

After each battle you will earn coins and experience which you will need when you visit the armoury. In the armoury you can purchase new weapons and view their stats.

Buy new gear and defeat all 10 champions to beat The Arena.

# Screnshots

First screen: https://github.com/RhyG/arena-game/blob/master/docs/first_screen.png
Commands: https://github.com/RhyG/arena-game/blob/master/docs/new_player_commands.png
Fight: https://github.com/RhyG/arena-game/blob/master/docs/enemy_list.png
Victory screen: https://github.com/RhyG/arena-game/blob/master/docs/victory_screen.png
Stats: https://github.com/RhyG/arena-game/blob/master/docs/stats_screen.png
Armoury: https://github.com/RhyG/arena-game/blob/master/docs/armoury_screen.png


# Project timeline

### Day 1:
* Finalise idea
* Implement core functionality
* Build player class
* Build enemy class
* Work out fight method
* Build main menu
* Testing

### Day 2: 
* Extensive testing
* Make everything pretty
* Coins and levelling up features
* Implement armoury feature
* Implement gems

# Reasons behind decisions

* The app was built with the intention of each aspect of the game have its own file. The weapons methods and information remain in the weapons file, the methods responsible for giving the weapon to the player live in the player class however.
* Classes were used for the enemies and the player as they both have variables which will be accessed change throughout the game. 
* The weapons are in an array of hashes because their variables are constant throughout the game, and because hashes are cool.
* The menu and end game methods are in the main file because they are the default state of the player
* Keeping the code DRY and easily read was a big development goal, and while not perfect that goal has mostly been achieved in breaking the files up into their individual purposes

# Known issues and potential improvements

* All enemies accessible, just not displayed
* When choosing enemy only a single letter required
* Better refine the enemy stats so progression and difficulty scales better
* Better improve classes and method organisation. Currently most methods exist in player class as the player is the one calling them, with more time could be improved to be more DRY.
* The arrays containing the enemies are currently global. While this works it is poor practice, and remains this way simply due to time constraints.

# Favourite parts of development

* Nostalgia of childhood games
* Tackling problems within fight method
* Creating names of characters
* When it actually works

# Future of The Arena

Were we to continue develop the app there are a number of features we would love to implement, as well as a few things we would change.

* Improve fight function so enemy also does damage to player
* Refine experience system so amount varies depending on level of enemy and performance in fight
* Add more weapons
* Implement more modifiers for in combat including damage mitigation
* Allow user to purchase armour to improve stats
* Implement more interactive battle method allowing user to see what damage they deal and receive as well as current health
* Create completely immersive VR experience allowing the player to feel and live as if they are their character, and to make every swing and take every hit from within the arena.
* Revolutionise not just gaming, but reality as we know it. Usher in a new era of life as all people seek to compete in the arena bringing an epoch of human peace and achievement as any negativity and disagreement is resolved through the game