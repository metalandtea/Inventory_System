// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function plrWalk(_input_left, _input_right, _input_up, _input_down){
	
	var key_left = keyboard_check(_input_left);
	var key_right = keyboard_check(_input_right);
	var key_up = keyboard_check(_input_up);
	var key_down = keyboard_check(_input_down);
	
	var _x = (key_right - key_left) * global.PLAYER_WALKSP;
	var _y = (key_down - key_up) * global.PLAYER_WALKSP;
	
	//State Change(for animation)
	
	if _x = 0 && _y = 0{
		changeState(states.idle);
	}
	else{
		changeState(states.walk);
	}
	
	//Change Direction(for animation)
	if _y < 0{
		changeDir(dir.backward);
	}
	else if _y > 0{
		changeDir(dir.forward);	
	}
	else if _x > 0{
		changeDir(dir.right);
	}
	else if _x < 0{
		changeDir(dir.left);
	}
	
	//       X VALUES
		if !place_meeting(o_plr.x+_x,o_plr.y,o_wall){
			o_plr.x += 	_x
		}
		else if !place_meeting(o_plr.x+sign(_x),o_plr.y,o_wall){
			o_plr.x += _y;	
		}
		
	//       Y VALUES
	
		if !place_meeting(o_plr.x,o_plr.y+_y, o_wall){
			o_plr.y += _y;	
		}
		else if !place_meeting(o_plr.x,o_plr.y+sign(_y),o_wall){
			o_plr.y += sign(_y)
		}
}




function changeState(_state){
	global.PLAYER_STATE = _state;
}




function changeDir(_dir){
	global.PLAYER_DIR = _dir;
}




function plrAnimate(){
	switch global.PLAYER_STATE{
		
		//IDLE
		case states.idle:
			
			//Direction
			switch global.PLAYER_DIR{
				
				case dir.forward: o_plr.sprite_index = s_plr_front_idle; break;
				case dir.backward: o_plr.sprite_index = s_plr_back_idle; break;
				case dir.left: o_plr.sprite_index = s_plr_side_idle; image_xscale = -1; break;
				case dir.right: o_plr.sprite_index = s_plr_side_idle; image_xscale = 1; break;
			}
		break;
		
		//WALK
		case states.walk:
		
			//Direction
			switch global.PLAYER_DIR{
			
				case dir.forward: o_plr.sprite_index = s_plr_front_walk; break;
				case dir.backward: o_plr.sprite_index = s_plr_back_walk; break;
				case dir.left: o_plr.sprite_index = s_plr_side_walk; image_xscale = -1; break;
				case dir.right: o_plr.sprite_index = s_plr_side_walk; image_xscale = 1; break;
			}
	}
}


//       Inventory

function inventorySearch(_id){
	for (var i = 0;i < INVENTORY_SIZE;i += 1){
		if global.INVENTORY[i] = _id{
			return(i);
		}
	}
	return(-1);
}

function inventoryDraw(){
		for (var i = 0;i < INVENTORY_SIZE;i++){
		
		var xx = (i * 16)+o_inventory.x;
		var yy = o_inventory.y;
		
		if global.INVENTORY[i] != -1{
			draw_sprite(s_items,global.INVENTORY[i],xx,yy);
		}
	}
}

function inventoryAdd(_id){
	var _slot = inventorySearch(-1);
	
	if _slot != -1{
		global.INVENTORY[_slot] = _id;
		return;
	}
	return;
}

function inventoryRemove(_slot){
	
	global.INVENTORY[_slot] = -1;
}

function inventoryRemoveType(_type,_amt){
	
	var _slot = inventorySearch(_type);
	
	for (var i = 0;i<_amt;i++){
		
		if _slot != -1{
			global.INVENTORY[_slot] = -1;
		}
	}
}

function changeFullscreen(){
	if window_get_fullscreen() == false{
	window_set_fullscreen(true);	
}
	else{
		window_set_fullscreen(false);	
	}	
}

function throwBall(){
	var has_found = inventorySearch(items.ball);
	
	if has_found != -1{
		inventoryRemoveType(items.ball,1);
		var wall = instance_create_layer(x+16,y-(sprite_height/2),"Instances",o_wall);
		wall.visible = true;
	}
}

function throwPaper(){
	var has_found = inventorySearch(items.paper);
	
	if has_found != -1{
		inventoryRemoveType(items.paper,1);
		
		room_restart();
	}
}