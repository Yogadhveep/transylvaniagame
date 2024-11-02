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
	new_player.name = "Player"+str(index+1)
	position_player(new_player,index+1)
	# Add it to the current scene
	$Players.add_child(new_player)

func position_player(player, index):
	var not_found = true
	while not_found:
		var random_num = RandomNumberGenerator.new().randi_range(1, 14)
		var random_node = get_node("Graph").get_node("Node"+str(random_num))
		if !random_node.occuppied():
			not_found = false
			player.set_pos(random_num)
			player.position = random_node.position
			random_node.occupy_by(index)
	
