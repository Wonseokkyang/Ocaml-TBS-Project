Name: Won Seok Yang
Class: Functional Programming in Ocaml
Date: June 26, 2019

Project
For this class I will be making a turnbased RPG using Ocaml and it's builtin
Graphics module. 

(** Add more info about what I'm making here **)

I will first start by creating basic base elements and expanding upon it as
the program gets built out.

Ultimately, I want the program to fit a few criteria:
	[ ] 3-5 unit types               {HP, ATK, RNG, MV}
	  [ ] Melee: basic attack unt    { 3, 1, 1, 1}
	  [ ] Range: increase atk range  { 2, 1, 2, 1}
	  [ ] Calvery: increase MV       { 2, 1, 1, 3}
	[ ] User cursor to select grid and units
	[ ] Implimentation of simple move and attack AI
	[ ] Different terrain types

If I have enough time I'd like to accomplish:	
	[ ] A menu
	  [ ] Variable playable grid size
	[ ] An info panel displaying terrain and unit info to player  
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
[ ] Create a 10 x 10 grid to display game elements
  [ ] A data structure to keep track of the grid and it's contents
[ ] Create a unit structure
  [ ] Create first unit