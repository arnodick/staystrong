if (argument0 == -1)
{
    create_object( argument1, argument2, "space");
}
else if (argument0 == 0)
{
    if (argument1 == r_width - 1)
    {
        create_object( argument1, argument2, "superwall");
    }
    else
    {
        create_object( argument1, argument2, "space");
    }
}
else if (argument0 == 1)
{
    if (argument1 == 0)
    {
        create_object( argument1, argument2, "superwall");
    }
    else
    {
        create_object( argument1, argument2, "space");
    }
}
else if (argument0 == 2)
{
    if (argument2 == r_height - 1)
    {
        create_object( argument1, argument2, "superwall");
    }
    else
    {
        create_object( argument1, argument2, "space");
    }
}
else if (argument0 == 1)
{
    if (argument2 == 0)
    {
        create_object( argument1, argument2, "superwall");
    }
    else
    {
        create_object( argument1, argument2, "space");
    }
}
