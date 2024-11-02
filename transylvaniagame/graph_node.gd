extends Node2D


var player = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Button").disabled = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	if player == -1:
		move_player()
	else:
		print("ENGAGE")
	$"../../Players".get_node("Player"+str(Global.turn)).selected(false)
	Global.turn_ended()
	$"../../Players".get_node("Player"+str(Global.turn)).selected(true)
	
	var connections = Global.get_connected(get_index_from_name())
	for connection in connections:
		get_parent().get_node("Node"+str(connection)).highlight_node(false)
	

func move_player():
	var current_player = $"../../Players".get_node("Player"+str(Global.turn))

	current_player.position = position
	var from_node = $"..".get_node("Node"+str(current_player.get_pos()))
	from_node.move_clear()
	current_player.set_pos(get_index_from_name())
func move_clear():
	player = -1
func highlight_moves():
	var connections = Global.get_connected(get_index_from_name())
	for connection in connections:
		get_parent().get_node("Node"+str(connection)).highlight_node(true)
func occuppied():
	if player != -1:
		return true
	return false
func occupy_by(id: int):
	player = id
func get_index_from_name() -> int:
	var name = get_name()  # Get the name of the node, e.g., "Node7"
	var regex = RegEx.new()
	regex.compile(r"\d+")  # This regular expression matches one or more digits
	var result = regex.search(name)
	
	if result:
		return int(result.get_string())  # Convert the extracted number to an integer
	else:
		return -1  # Return -1 if no number is found

func highlight_node(enable):
	get_node("Button").disabled = not enable
