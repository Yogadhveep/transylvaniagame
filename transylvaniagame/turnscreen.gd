extends Control

var avatar = {
	1:"res://Dracula.png",
	2:"res://frankenstein.png",
	3:"res://Murray.png",
	4:"res://Wayne.png",
	5:"res://Griffin.png",
	6:"res://Blobby.png"
}
var colors = {
	1: Color(1, 0, 0),       # Red
	2: Color(0, 0.5, 0),       # Green
	3: Color(0, 0, 1),       # Blue
	4: Color(1, 0.5, 0),       # Orange
	5: Color(1, 0, 1),       # Magenta
	6: Color(0.5, 0, 0.5)       # Magenta
}

var active = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$".".visible = false
	$VBoxContainer/Button.disabled = false
	active = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if not active:
		$VBoxContainer/Sprite2D.visible = true
		active = true
		$VBoxContainer/Button.text = "Play Turn"
	else:
		$VBoxContainer/Button.disabled = true
		$".".visible = false
		active = false
		enable_movement(true)
		
func show_new_turn():
	$".".visible = true
	$VBoxContainer/Sprite2D.visible = false
	$VBoxContainer/Sprite2D.texture = load(avatar[Global.player_roles[Global.turn]])
	$VBoxContainer/Label.text = "Player's "+str(Global.turn)+" Turn"
	$ColorRect.color = colors[Global.turn]
	$VBoxContainer/Button.disabled = false
	$VBoxContainer/Button.text = "Show Character"
	active = false
	enable_movement(false)
	
func enable_movement(enabled):
	$"../Graph/Node1/Button".disabled = not enabled
	$"../Graph/Node2/Button".disabled = not enabled
	$"../Graph/Node3/Button".disabled = not enabled
	$"../Graph/Node4/Button".disabled = not enabled
	$"../Graph/Node5/Button".disabled = not enabled
	$"../Graph/Node6/Button".disabled = not enabled
	$"../Graph/Node7/Button".disabled = not enabled
	$"../Graph/Node8/Button".disabled = not enabled
	$"../Graph/Node9/Button".disabled = not enabled
	$"../Graph/Node10/Button".disabled = not enabled
	$"../Graph/Node11/Button".disabled = not enabled
	$"../Graph/Node12/Button".disabled = not enabled
	$"../Graph/Node13/Button".disabled = not enabled
	$"../Graph/Node14/Button".disabled = not enabled
