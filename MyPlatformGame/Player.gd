extends KinematicBody2D

const SPEED = 60
const GRAVITY = 10
var velocity = Vector2()
const JumpStrength = -250
const FLOOR = Vector2(0,-1)

const FIREBALL = preload("res://FireBall.tscn") 

var enemy_in_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true



func _physics_process(delta):
	
	enemy_attack()
	update_health()
	if health <= 0:
		player_alive = false #add game-over screen
		health = 0
		print ("player is dead")
		self.queue_free()
	
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = false
		if sign($Position2D.position.x) == -1:
			$Position2D.position.x *= -1
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite.play("Walk")
		$AnimatedSprite.flip_h = true
		if sign($Position2D.position.x) == 1:
			$Position2D.position.x *= -1
	else: 
		velocity.x = 0
		if is_on_floor():
			$AnimatedSprite.play("Idle")
		
		
		
	if Input.is_action_pressed("ui_up") && is_on_floor():
		velocity.y = JumpStrength
	
	if Input.is_action_just_pressed("attack"):
		var fireball = FIREBALL.instance()
		if sign($Position2D.position.x) == 1:
			fireball.set_fireball_direction(1)
		else:
			fireball.set_fireball_direction(-1)
		get_parent().add_child(fireball) 
		fireball.position = $Position2D.global_position
		
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity, Vector2.UP)
	
	






func player():
	pass

func _on_PlayerHitbox_body_entered(body):
	if body.has_method("Enemy"):
		enemy_in_range = true
	if body.has_method("flying enemy"):
		enemy_in_range = true
	if body.has_method("spike"):
		enemy_in_range = true



func _on_PlayerHitbox_body_exited(body):
	if body.has_method("Enemy"):
		enemy_in_range = false
	if body.has_method("flying enemy"):
		enemy_in_range = false
	if body.has_method("spike"):
		enemy_in_range = false



func enemy_attack():
	if enemy_in_range and enemy_attack_cooldown == true:
		health = health - 20 
		enemy_attack_cooldown = false
		$"Attack-cooldown".start()
		
		print(health)


func _on_Attackcooldown_timeout():
	enemy_attack_cooldown = true 



func update_health():
	var healthbar = $Healthbar
	healthbar.value = health
	
	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true

