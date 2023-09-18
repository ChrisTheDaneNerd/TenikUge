extends KinematicBody2D

var GRAVITY = 10
export var SPEED = 45
var player_position
var target_position : Vector2
onready var player = get_parent().get_node("player")

var attack_range = 3000

var is_dead = false 

func _ready():
	pass 


func dead(): 
	is_dead = true
	SPEED = 0 
	$AnimatedSprite.play("dead")
	$CollisionShape2D.disabled = true 
	$Timer.start()
	GRAVITY = 10


func _physics_process(delta):
	if is_dead == false:
		GRAVITY = 0 
		player_position = player.position
		target_position = (player_position - position).normalized()
		
		if position.distance_to(player_position) < attack_range:
			move_and_slide(target_position * SPEED)
			look_at(player_position)
