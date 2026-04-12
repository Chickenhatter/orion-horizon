extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Vlack.self_modulate.a = 1
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file('res://Main_space.tscn')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Vlack.self_modulate.a -= 0.03
