extends Control

var avatar = {
	1:"res://Dracula.png",
	2:"res://frankenstein.png",
	3:"res://Murray.png",
	4:"res://Wayne.png",
	5:"res://Griffin.png",
	6:"res://Blobby.png"
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
		
func show_new_turn():
	$".".visible = true
	$VBoxContainer/Sprite2D.visible = false
	$VBoxContainer/Sprite2D.texture = load(avatar[Global.player_roles[Global.turn]])
	$VBoxContainer/Label.text = "Player's "+str(Global.turn)+" Turn"
	$VBoxContainer/Button.disabled = false
	$VBoxContainer/Button.text = "Show Character"
	active = false
