extends KinematicBody2D
var coins = 0 
var speed = 100
var velocity = Vector2()
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"): 
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"): 
		velocity.x = -speed
	else:
		velocity.x = 0
	velocity = move_and_slide(velocity,Vector2.UP)

func GetCoin():
	coins += 1 
	print(coins)
