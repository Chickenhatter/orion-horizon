extends CharacterBody2D
var spaceman = true
var direction = Vector2.UP.rotated(rotation)
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var percent = 0
var battery = 0
func _physics_process(delta: float) -> void:
	if spaceman == true:
		var movement = Vector2.ZERO
		movement = movement.rotated(deg_to_rad(90))
		if not is_on_floor():
			velocity += get_gravity() * delta
		if Input.is_action_pressed('ui_w'):
			movement.y -= 1
			percent += 0.0001
		if Input.is_action_pressed('ui_a'):
			$"../source".rotation_degrees -= 0.03
		if Input.is_action_pressed('ui_d'):
			$"../source".rotation_degrees += 0.03
		if Input.is_action_pressed('ui_s'):
			movement.y += 1
			percent += 0.0001
		# Bar
		$"../Camera2D/Path2D/PathFollow2D/bar/Path2D/PathFollow2D".progress_ratio = percent
		if percent < 0.5:
			$"../Camera2D/Path2D/PathFollow2D/bar/Path2D/PathFollow2D/Color".play('G')
		elif percent < 0.75:
			$"../Camera2D/Path2D/PathFollow2D/bar/Path2D/PathFollow2D/Color".play('Y')
		elif percent <= 0.99:
			$"../Camera2D/Path2D/PathFollow2D/bar/Path2D/PathFollow2D/Color".play('R')
		else:
			get_tree().change_scene_to_file('res://Died.tscn')
		
		# Battery
		if battery == 0:
			$"../Camera2D/Path2D/PathFollow2D/bar/Node2D/AnimatedSprite2D".play('none')
		if battery == 1:
			$"../Camera2D/Path2D/PathFollow2D/bar/Node2D/AnimatedSprite2D".play('battery')
			$"../Camera2D/Path2D/PathFollow2D/bar/Node2D/AnimatedSprite2D2".play('none')
		if battery == 2:
			$"../Camera2D/Path2D/PathFollow2D/bar/Node2D/AnimatedSprite2D2".play('battery')
			$"../Camera2D/Path2D/PathFollow2D/bar/Node2D/AnimatedSprite2D3".play('none')
		if battery == 3:
			$"../Camera2D/Path2D/PathFollow2D/bar/Node2D/AnimatedSprite2D3".play('battery')
			$"../Camera2D/Path2D/PathFollow2D/bar/Node2D/AnimatedSprite2D4".play('none')
		if battery == 4:
			$"../Camera2D/Path2D/PathFollow2D/bar/Node2D/AnimatedSprite2D4".play('battery')
		if battery == 5:
			battery -= 1
			percent = 0
		#Whatever else IDK
		$".".rotation_degrees = $"../source".rotation_degrees
		rotation = $"../source".rotation_degrees
		movement = movement.rotated(rotation)
		velocity = movement * 300
		$"../Camera2D".rotation_degrees = $".".rotation_degrees
		$"../Camera2D".position = $".".position
		$"../Camera2D/Path2D/PathFollow2D".progress_ratio = 0
		
	else:
		$"../Camera2D/Path2D/PathFollow2D".progress_ratio = 99.9
	move_and_slide()


func _on_button_pressed() -> void:
	if battery >= 1:
		battery -= 1
		percent = 0


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == 'Asteroid':
		$explode.play('explode')
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file('res://Died.tscn')


func _on_ship_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		if battery == 3:
			$"../../Ship/AnimatedSprite2D".play('closed')
			$"../../Ship/AnimatedSprite2D".z_index = 100
			await get_tree().create_timer(3).timeout
			get_tree().change_scene_to_file('res://end.tscn')


func _on_battery_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery".position = Vector2(1000,1000)


func _on_battery_2_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery2".position = Vector2(1000,1000)


func _on_battery_3_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery3".position = Vector2(1000,1000)


func _on_battery_4_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery4".position = Vector2(1000,1000)


func _on_battery_5_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery5".position = Vector2(1000,1000)


func _on_battery_6_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery6".position = Vector2(1000,1000)

func _on_battery_7_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery7".position = Vector2(1000,1000)

func _on_battery_8_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery8".position = Vector2(1000,1000)


func _on_battery_9_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery9".position = Vector2(1000,1000)


func _on_battery_10_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery10".position = Vector2(1000,1000)


func _on_battery_11_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery11".position = Vector2(1000,1000)


func _on_battery_12_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery12".position = Vector2(1000,1000)


func _on_battery_13_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery13".position = Vector2(1000,1000)


func _on_battery_14_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery14".position = Vector2(1000,1000)


func _on_battery_15_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery15".position = Vector2(1000,1000)


func _on_battery_16_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery16".position = Vector2(1000,1000)


func _on_battery_17_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery17".position = Vector2(1000,1000)


func _on_battery_18_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery18".position = Vector2(1000,1000)


func _on_battery_19_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery19".position = Vector2(1000,1000)


func _on_battery_20_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery20".position = Vector2(1000,1000)


func _on_battery_21_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery21".position = Vector2(1000,1000)


func _on_battery_22_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery22".position = Vector2(1000,1000)


func _on_battery_23_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery23".position = Vector2(1000,1000)


func _on_battery_24_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery24".position = Vector2(1000,1000)


func _on_battery_25_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery25".position = Vector2(1000,1000)


func _on_battery_26_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		battery += 1
		$"../../battery/battery26".position = Vector2(1000,1000)
