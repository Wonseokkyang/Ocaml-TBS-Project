
## **Discontinued**

Name: Won Seok Yang 
Date: June 26, 2019


>To run the program:
```
  "make"
  "./game"
```


Project
I will be making a turnbased RTS using Ocaml and it's builtin
Graphics module. I will also be learning how to use github!

I want to create a game where the player is presented with a gameboard of 
units they control and units the computer controls. The objective of the 
game is to eliminte all enemy units using the units provided.
There will be different unit types with different stats as well as different
terrain types that will affect gameplay.


I will list goals/milestones below and add/check them off as I progress.
For a more detailed history check "changelog.txt".

I will first start by creating basic base elements and expanding upon it as
the program gets built out.

Ultimately, I want the program to fit a few criteria:
	[ ] 3-5 unit types               {HP, ATK, RNG, MV}
	  [-] Melee: basic attack unt    { 3, 1, 1, 1}
	  [ ] Range: increase atk range  { 2, 1, 2, 1}
	  [ ] Calvery: increase MV       { 2, 1, 1, 3}
	[X] User cursor to select grid and units
	[ ] Implimentation of simple move and attack AI
	[-] Different terrain types

If I have enough time I'd like to accomplish:	
	[ ] A menu
	  [ ] Variable playable grid size
	[ ] An info panel displaying terrain and unit info of current tile to player  
	[ ] A pleasing GUI
	[ ] Different terrain effects
	  [ ] Forest: decrease attack range by 1
	  [ ] Mountain/Hills: decrease movement by 1 but increase range by 1
	  [ ] Water: If entered this turn, unit cannot attack

Thing's that would be awesome but I probably won't be able to implement in time:
	[ ] Individual unit leveling
	  [ ] Increases in stats per level
	  [ ] Class upgrades with enough levels giving major buffs 
	[ ] Fog of war that hides parts of the map unless a player unit has occupied it
	[ ] Different levels/grid sets for the player to go through	
	

Initial Steps:
[-] Create a 10 x 10 grid to display game elements
  [X] A data structure to keep track of the grid and it's contents
    [X] Basic terrain png
  [X] Implemented 2D list to gameboard graphics

[ ] Create a unit structure
  [-] Create first unit
    [X] Create first unit sprite

[~] Learn how to use github

[X] Create basic cursor
  [X] Implement user input
  [X] Implement screen boundaries
  [X] Implement select and cancel 

[ ] Fixing input lag (caused by constant png to image conversion)

