/// @description Initialize variables

// Inherit the parent event
event_inherited();

// You can write your code in this editor
state[3] = true;
state[4] = true;
canFire = true;

image_index = 0
image_speed = 0

//Initialize enemy variables
enemySpeed = 4;
hp = 200;
dmg = 15;
range = 28;
fireRate = 20;
attackSpeed = 7;
homing = 1;
attackTol = 64;  //Number of pixels away after range*attackSpeed the enemy must be before attacking
verticalTol = 64; //Number of pixels above or below the player must be before attacking
trigAttackedReset = 30;  //Number of steps to perform trigAttacked action