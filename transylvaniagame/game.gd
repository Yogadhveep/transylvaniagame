extends Control

# Declare player_count with the correct syntax and remove setget if you’re directly calling a setter function.

func _ready():
	# Instead of using setget, we directly call the function to set player_count
	set_player_count()

func set_player_count() -> void:
	for i in range(Global.player_count):
		create_player(i)

func create_player(index: int) -> void:
	# Example of creating player instances
	print("Creating player:", index + 1)
	var new_player = preload("res://Player.tscn").instantiate()
	new_player.name = "Player"+str(index)
	# Add it to the current scene
	$Players.add_child(new_player)
	
