if (argument0 == 0 or argument0 == 1 or argument0 == -1)
{
    //map[argument1, argument2] = instance_create(argument1, argument2, oSpace);
    create_object( argument1, argument2, "space");
}
else
{
    //map[argument1, argument2] = instance_create(argument1, argument2, oWall);
    //map[argument1, argument2] = create_object( argument1, argument2, oWall, true, '|', c_dkgray, 1, 'rubble', sndCrash, 0, int_to_bin(item_type.smash) );
    create_object( argument1, argument2, "wallv");
}
