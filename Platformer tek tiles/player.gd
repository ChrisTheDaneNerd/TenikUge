extends KinematicBody2D
var speed = 60
var velocity = Vector2()

func _ready():
	pass
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	else:
		velocity.x = 0
	
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_player_body_entered(body):
	if "coin" in body.name:
		body.is_coin_touched()



