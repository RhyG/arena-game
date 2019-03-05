# The Arena

The Arena is a simple text-based RPG played in the terminal.

### Description

The purpose of this app to take the user on a journey like never before. Sherine wanted to pretend she was a fierce warrior and so we built a role playing app allowing her to live out her fantasy.

The Arena app is a simple, RPG battle game where the player trains against other people, levels up, earns money and buys new weapons all with the goal of defeating all 10 champions.

### Functionality

This app works through a number of different methods called from the player class. On launch the user creates a new player and is presented with a list of options. From there they can choose to select enemies and fight.
The winner is determined by calculating a random number between 1 and their current weapon damage. This is then applied to the enemy health until all five rounds are complete. At the end of the five rounds, if the enemy has any health left
the player loses, otherwise they emerge victorious and earn experience and coins.

The player is also able to visit 'the armoury' from which they can view a list of weapons, and if they have enough coin and are a high enough level they can purchase new weapons increasing their damage.

The game ends when all champions have been defeated.

### Instructions for use

On launch you will be prompted to give a name to your hero. Once you have done that you can view and choose menu options. There are practice bots you can fight to get started, and when you feel ready you can fight the champions. More champions will be revealed as you level up.

After each battle you will earn coins and experience which you will need when you visit the armoury. In the armoury you can purchase new weapons and view their stats.

Buy new gear and defeat all 10 champions to beat The Arena.

### Details of design and planning process inlcuding
* Evidence of app idea brainstorming sessions
* app User/Workflow diagram
* Project plan and timeline
* Screenshots of Trello board

### Project timeline

### Day 1:
* Finalise idea
* Implement core functionality
* Build player class
* Build enemy class
* Work out fight method
* Build main menu

### Day 2: 
* Extensive testing
* Make everything pretty
* Coins and levelling up features
* Implement armoury feature
* Implement gems

### Known issues and potential improvements

* All enemies accessible, just not displayed
* When choosing enemy only a single letter required
* Better refine the enemy stats so progression and difficulty scales better
* Better improve classes and method oranisation. Currently most methods exist in player class as the player is the one calling them, could be improved to be more DRY.

### Future of The Arena

Were we to continue develop the app there are a number of features we would love to implement, as well as a few things we would change.

* Improve fight function so enemy also does damage to player
* Refine experience system so amount varies depending on level of enemy and performance in fight
* Add more weapons
* Implement more modifiers for in combat including damage mitigation
* Allow user to purchase armour to improve stats
* Implement more interactive battle method allowing user to see what damage they deal and receive as well as current health