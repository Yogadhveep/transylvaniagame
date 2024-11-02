
extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for player in range(1,Global.player_count+1):
		if not (player in Global.dead):
			$Label.text = "PLAYER "+str(player)+" WON!"
			return


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
