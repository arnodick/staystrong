if (instance_exists(oSprite))
{
    with (oSprite)
    {
        instance_destroy();
    }
}
for (a = 0; a < 8; a++)
{
    sprite = instance_create((x * map.tile_size) + map.tile_size/2, (y * map.tile_size) + map.tile_size/2, oSprite);
    //sprite.speed = choose(2, 2.25, 2.5, 2.75, 3);
    sprite.hacceleration = 0.05;
    sprite.hspeed = random_range(-2, 2);
    //sprite.direction = irandom(359);
    sprite.vacceleration = 0.15;
    sprite.vspeed = random_range(-2, -1);
    sprite.alarm[0] = room_speed/2;
}
