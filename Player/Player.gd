extends KinematicBody2D

const MAX_SPEED = 100
const ACCELERATION = 10
const FRICTION = 10

var velocity = Vector2.ZERO

func _physics_process(delta):
	# Test tombol :
	#if Input.is_action_pressed("ui_right"):
		# print("You Pressed the right arrow key")
		
	# Cara Pertama menggerakan object player :
	#if Input.is_action_pressed("ui_right"):
		# position.x += 10
	#elif Input.is_action_pressed("ui_left"):
		# position.x -= 10
	
	# Cara Kedua menggerakan object player menggunakan velocity:
	#if Input.is_action_pressed("ui_right"):
	#	velocity.x = 4
	#elif Input.is_action_pressed("ui_left"):
	#	velocity.x = -4
	#elif Input.is_action_pressed("ui_up"):
	#	velocity.y = -4
	#elif Input.is_action_pressed("ui_down"):
	#	velocity.y = 4
	#else:
	#	velocity.x = 0
	#	velocity.y = 0
	
	# Cara ketiga tetap menggunakan velocity tapi menggunakan input strengt agar lebih smooth di rpg
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * ACCELERATION * delta
		velocity = velocity.clamped(MAX_SPEED * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	# As we add delta to velocity that means velocity will relative to our framerate
	# Our player will move in actual realtime
	print(velocity)
	move_and_collide(velocity)
