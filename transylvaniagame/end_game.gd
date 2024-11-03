
extends Control

var colors = {
	1: Color(1, 0, 0),       # Red
	2: Color(0, 0.5, 0),       # Green
	3: Color(0, 0, 1),       # Blue
	4: Color(1, 0.5, 0),       # Orange
	5: Color(1, 0, 1),       # Magenta
	6: Color(0.5, 0, 0.5)       # Magenta
}
var avatar = {
	1:"res://Dracula.png",
	2:"res://frankenstein.png",
	3:"res://Murray.png",
	4:"res://Wayne.png",
	5:"res://Griffin.png",
	6:"res://Blobby.png"
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for player in range(1,Global.player_count+1):
		if not (player in Global.dead):
			$Label.text = "PLAYER "+str(player)+" WON!"
			$ColorRect.color = colors[player]
			$Sprite2D2.texture = load(avatar[Global.player_roles[player]])
			$Timer.start()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://MainScreen.tscn")
	Global.reset()
