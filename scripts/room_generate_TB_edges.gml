if (argument0 == 2 or argument0 == 3 or argument0 == -1)
{
    map[argument1, argument2] = instance_create(argument1, argument2, oSpace);
}
else
{
    map[argument1, argument2] = instance_create(argument1, argument2, oWall);
}
