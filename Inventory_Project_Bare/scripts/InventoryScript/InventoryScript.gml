//Variables

#macro INVENTORY_SIZE 9
global.INVENTORY = array_create(INVENTORY_SIZE,-1);

global.SLOTSIZE = 16;



///									  ///
///--------/	FUNCTIONS    /--------///
///									  ///


function inventorySearch(_id){
	for (var i = 0;i < INVENTORY_SIZE;i += 1){
		if global.INVENTORY[i] = _id{
			return(i);
		}
	}
	return(-1);
}

function inventoryDraw(x_pos,y_pos){
		for (var i = 0;i < INVENTORY_SIZE;i++){
		
		var xx = (i * global.SLOTSIZE)+x_pos;
		var yy = y_pos;
		
		if global.INVENTORY[i] != -1{
			draw_sprite(s_items,global.INVENTORY[i],xx,yy);
		}
	}
}

function inventoryAdd(_id){
	var _index = inventorySearch(-1);
	
	if _index != -1{
		global.INVENTORY[_index] = _id;
		return true;
	}
	return false;
}

function inventoryRemove(_index){
	
	global.INVENTORY[_index] = -1;
}

function inventoryRemoveType(_id,_amt){
	
	for (var i = 0;i<_amt;i++){
		var _index = inventorySearch(_id)
		
		if _index != -1{
			global.INVENTORY[_index] = -1;
		}
	}
}
