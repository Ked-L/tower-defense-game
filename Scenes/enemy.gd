extends CharacterBody2D

@export var player_reference : CharacterBody2D
var speed : float = 75

func _physics_process(delta):
	if not is_instance_valid(player_reference):
		return
	velocity = (player_reference.position - position).normalized() * speed
	move_and_collide(velocity * delta)
