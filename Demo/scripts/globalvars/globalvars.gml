// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//Player Direction

enum dir{
	forward,
	backward,
	left,
	right,
}

//Player States

enum states{
	idle,
	walk,
	attack,
}

global.PLAYER_DIR = dir.forward;
global.PLAYER_WALKSP = 1;
global.PLAYER_STATE = states.idle;

//Keybinds

global.KEY_LEFT = ord("A");
global.KEY_RIGHT = ord("D");
global.KEY_UP = ord("W");
global.KEY_DOWN = ord("S");


//Inventory

#macro INVENTORY_SIZE 9

global.INVENTORY = array_create(INVENTORY_SIZE,-1);

//Selection:

global.SELECTED_SLOT = 0;
global.SELECTED_ITEM = -1;

//Items

//Items correspond with image_index of o_item_pickup
enum items{
	ball,
	paper,
}

//walls

global.walls = 0;