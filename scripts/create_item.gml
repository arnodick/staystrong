// create_item(x, y, oObject, char, colour, oDead, item_type)

var item = create_thing(argument0, argument1, argument2, argument3, argument4, argument5);

item.item_type = argument6;
item.dead = oSpace; //just to ensure item doesn't leave anything behing
//TODO: make dead work another way bc right now destroy code is just making an oRoad

with (oGame.map[argument0, argument1])
{
    instance_destroy();
}
oGame.map[argument0, argument1] = item;

return item;
