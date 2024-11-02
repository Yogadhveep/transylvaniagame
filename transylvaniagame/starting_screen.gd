#Button handler for starting screen scene
extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_cancel_pressed() -> void:
	get_tree().change_scene_to_file("res://MainScreen.tscn")


func _on_start_game_pressed() -> void:
	Global.player_count = $VBoxContainer/PlayerCountCont2/PlayerCount.value
	get_tree().change_scene_to_file("res://Game.tscn")
