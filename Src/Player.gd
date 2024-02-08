extends KinematicBody2D

var VELOCITY = Vector2.ZERO
var MOVE_SPEED = 50
var JUMP_SPEED = 80
export(bool) var IS_REVERSED = false
var ROTATION_SPEED = 2
var DIRECTION = 1 
var GRAVITY = 4

func _ready():
	pass # Replace with function body.

func apply_gravity(delta):
	if IS_REVERSED:
		VELOCITY.y -=2
		$AnimatedSprite.rotation_degrees = 180
	else:
		VELOCITY.y +=2
		$AnimatedSprite.rotation_degrees = 0

func apply_direction():
	if DIRECTION == -1:
		$AnimatedSprite.flip_h = true
	elif DIRECTION == 1:
		$AnimatedSprite.flip_h = false

func _physics_process(delta):
	if Input.is_action_just_pressed("power"):
		IS_REVERSED = !IS_REVERSED

	apply_gravity(delta)
	apply_direction()
	
	if Input.is_action_pressed("move_right"):
		VELOCITY.x =  - MOVE_SPEED if IS_REVERSED else MOVE_SPEED
		DIRECTION = -1
	elif Input.is_action_pressed("move_left"):
		VELOCITY.x = MOVE_SPEED if IS_REVERSED else - MOVE_SPEED
		DIRECTION = 1
	else:
		VELOCITY.x = 0

	if Input.is_action_just_pressed("jump"):
		if IS_REVERSED:
			VELOCITY.y = + JUMP_SPEED
		else:
			VELOCITY.y = - JUMP_SPEED

	VELOCITY = move_and_slide(VELOCITY)
