//lets creatures pick up items
//TODO: make amount just use hp

var picked_up = false;
var creature = instance_nearest(x, y, oCreature);

//gives ability of an item to the actor picking it up
with(creature)
{
    if ((x == other.x) and (y == other.y))  //if actor is on the item
    {
        if (other.item_type == item_type.blood) //if it is blood, only lower item's amount if actor is NOT bloody
        {
            if ( (abilities & int_to_bin(other.item_type)) !=  int_to_bin(other.item_type))
            {
                other.amount--;
            }
        }
        else if (other.item_type != item_type.rubble)   //for non-blood items, just lower amount by 1
        {
            other.amount--;
        }
        abilities = abilities | int_to_bin(other.item_type);    //gives actor item's ability
        colour = global.item_colours[other.item_type];  //changes actor's colour to item's colour
        picked_up = true;
    }
}

switch(item_type)
{
    case item_type.smash:
        if (picked_up == true)
        {
            audio_play_sound(sndPickup, 1, false);  //TODO: make sound a variable of item 
            if (creature.object_index == oPlayer)
            {
                oPlayer.smashes += 1;
            }
        }
        break;
    case item_type.blood:
        //makes adjacent tiles turn red randomly
        if random(100) < 1
        {
            oGame.map[x + choose(-1, 0, 1), y + choose(-1, 0, 1)].colour = global.item_colours[item_type];
        }
        //if blood has been picked up enough times, it disappears
        //unless the player is dead. then it never disappears
        if (amount <= 0)
        {
            if !(instance_exists(oPlayer))
            {
                amount = 1;
            }
        }
        break;
}

//make used up items disappear
if (amount <= 0)
{
    //TODO: figure out why this is needed
    oGame.map[x, y] = instance_create(x, y, oRoad);
    instance_destroy();
}
