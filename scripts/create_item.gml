// create_item(x, y, oObject, char, colour, oDead, item_type)

var item = create_thing(argument0, argument1, argument2, argument3, argument4, argument5);

item.item_type = argument6;
item.dead = -1; //just to ensure item doesn't leave anything behing
item.amount = 1;
//TODO: make dead work another way bc right now destroy code is just making an oRoad

return item;
