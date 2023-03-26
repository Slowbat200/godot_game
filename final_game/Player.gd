extends KinematicBody2D

const SPEED = 150
const IDLE_TIME = 3.0
const JUMP_FORCE = -500
const GRAVITY = 550
const MAX_JUMP_HEIGHT = 200
const MOVE_SPEED = 50
const INTERPOLATION_SPEED = 100

var velocity = Vector2()
var idle_timer = 0.0
var has_second_eye = false


# Player state
var vel = Vector2.ZERO
var jumping = false
var original_y = 0
var can_jump = true



#funkce ready
func _ready():
	original_y = position.y
	


	#funkce pro fyziku
func _physics_process(delta):
	if not has_second_eye:
		idle_timer += delta
		if idle_timer >= IDLE_TIME:
			$sprite.texture = load("res://Sprites/hero/hero_png/center.png")
			has_second_eye = true
	 velocity.y += GRAVITY * delta
	velocity.x = 0
	
	if is_on_floor():
		can_jump = true
	
	if Input.is_action_just_pressed("jump") and can_jump:
		jumping = true
		velocity.y = JUMP_FORCE
		$AudioStreamPlayer.play()
		can_jump = false



	if Input.is_action_pressed("move_right"):
		velocity.x += SPEED
		$sprite.texture = load("res://Sprites/hero/hero_png/move_right.png")
		$sprite.flip_h = false
		has_second_eye = false
		idle_timer = 0.0

	if Input.is_action_pressed("move_left"):
		velocity.x -= SPEED
		$sprite.texture = load("res://Sprites/hero/hero_png/move_left.png")
		$sprite.flip_h = true
		has_second_eye = false
		idle_timer = 0.0


# Jump
	if can_jump and Input.is_action_just_pressed("jump"):
		jumping = false
		velocity.y = JUMP_FORCE
		can_jump = false
		$AudioStreamPlayer.play()
		
	# Check if we've reached the maximum jump height
	if jumping and position.y < original_y - MAX_JUMP_HEIGHT:
		jumping = false
		velocity.y = 0
		position.y = 100
		can_jump = true
		
		
		
	if Input.is_action_just_pressed("jump") and not jumping:
		jumping = true
		velocity.y = JUMP_FORCE

		
		
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2.UP)

	if velocity.x <= 0:
		$sprite.flip_h = false
	elif velocity.x <= 0:
		$sprite.flip_h = true
		
		

	if position.y > 1000:
		get_tree().quit()
