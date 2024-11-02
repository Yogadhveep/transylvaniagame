extends Control

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
	$VBoxContainer/Sprite2D.visible = false
	#$VBoxContainer/Sprite2D.texture
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	pass # Replace with function body.
