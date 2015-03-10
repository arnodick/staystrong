if (argument0 == -1)
{
    map[argument1, argument2] = instance_create(argument1, argument2, oSpace);
}
else if (argument0 == 0)
{
    if (argument1 == r_width - 1)
    {
        map[argument1, argument2] = instance_create(argument1, argument2, oSuperwall);
    }
    else
    {
        map[argument1, argument2] = instance_create(argument1, argument2, oSpace);
    }
}
else if (argument0 == 1)
{
    if (argument1 == 0)
    {
        map[argument1, argument2] = instance_create(argument1, argument2, oSuperwall);
    }
    else
    {
        map[argument1, argument2] = instance_create(argument1, argument2, oSpace);
    }
}
else if (argument0 == 2)
{
    if (argument2 == r_height - 1)
    {
        map[argument1, argument2] = instance_create(argument1, argument2, oSuperwall);
    }
    else
    {
        map[argument1, argument2] = instance_create(argument1, argument2, oSpace);
    }
}
else if (argument0 == 3)
{
    if (argument2 == 0)
    {
        map[argument1, argument2] = instance_create(argument1, argument2, oSuperwall);
    }
    else
    {
        map[argument1, argument2] = instance_create(argument1, argument2, oSpace);
    }
}
