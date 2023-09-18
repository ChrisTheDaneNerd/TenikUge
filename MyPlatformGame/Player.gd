extends KinematicBody2D

const SPEED = 60
const GRAVITY = 10
var velocity = Vector2()
const JumpStrength = -250
const FLOOR = Vector2(0,-1)




func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = false
		
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = true
	else: 
		velocity.x = 0
		if is_on_floor():
			$AnimatedSprite.play("Idle")
		
		
		
	if Input.is_action_pressed("ui_up") && is_on_floor():
		velocity.y = JumpStrength
		
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, Vector2.UP)





