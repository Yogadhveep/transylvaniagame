
extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for player in range(1,Global.player_count+1):
		if not (player in Global.dead):
			$Label.text = "PLAYER "+str(player)+" WON!"
			$Timer.start()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://MainScreen.tscn")
	Global.reset()
