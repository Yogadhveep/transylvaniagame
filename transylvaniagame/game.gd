extends Control

# Declare player_count with the correct syntax and remove setget if you’re directly calling a setter function.

var colors = {
	1: Color(1, 0, 0),       # Red
	2: Color(0, 0.5, 0),       # Green
	3: Color(0, 0, 1),       # Blue
	4: Color(1, 0.5, 0),       # Orange
	5: Color(1, 0, 1),       # Magenta
	6: Color(0.5, 0, 0.5)       # Magenta
}


func _ready():
	# Instead of using setget, we directly call the function to set player_count
	set_player_count()
	Global.set_moves($Graph, get_node("Players").get_node("Player1").get_pos())
	print(Global.player_roles)
	print(Global.roles)
	$Control.show_new_turn()

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
		var random_num = RandomNumberGenerator.new().randi_range(1, 15)
		var random_node = get_node("Graph").get_node("Node"+str(random_num))
		if !random_node.occuppied():
			not_found = false
			player.set_pos(random_num)
			player.position = random_node.position
			random_node.occupy_by(index)
			player.set_circle_color(colors[index],index)
			Global.player_roles[index] = get_role()
			if index == 1:
				player.selected(true)
func get_role():
	var available_roles = {}
	for role_key in Global.roles:
		if role_key not in Global.player_roles.values():
			available_roles[role_key] = Global.roles[role_key]
	var values_role = available_roles.keys()
	var result = values_role[randi_range(0, values_role.size() - 1)]  
	return result
