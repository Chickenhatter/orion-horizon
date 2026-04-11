extends CharacterBody2D
var spaceman = true
var direction = Vector2.UP.rotated(rotation)
const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	if spaceman == true:
		var movement = Vector2.ZERO
		movement = movement.rotated(deg_to_rad(90))
		if not is_on_floor():
			velocity += get_gravity() * delta
		if Input.is_action_pressed('ui_w'):
			movement.y -= 1
		if Input.is_action_pressed('ui_a'):
			$"../source".rotation_degrees -= 0.03
		if Input.is_action_pressed('ui_d'):
			$"../source".rotation_degrees += 0.03
		if Input.is_action_pressed('ui_s'):
			movement.y += 1
		$".".rotation_degrees = $"../source".rotation_degrees
		rotation = $"../source".rotation_degrees
		movement = movement.rotated(rotation)
		velocity = movement * 300
		
	move_and_slide()
