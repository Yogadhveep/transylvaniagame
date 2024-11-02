# Global.gd
extends Node

var player_count: int = 0
var map = {
	1:[2],
	2:[1,3],
	3:[2,4,5,6,7,9,10],
	4:[3],
	5:[3],
	6:[3],
	7:[3,8],
	8:[7],
	9:[3],
	10:[3,11,13],
	11:[10,12,14],
	12:[11,13],
	13:[10,12],
	14:[11]
}
var turn = 1
var highlighted_moves = []
var dead = []
var alive = -1
var roles = {
	1:"Dracula",
	2:"Frankenstein",
	3:"Murray",
	4:"Wayne",
	5:"Griffin",
	6:"Blobby"
}
var player_roles = {}


func get_connected(node):
	return map.get(node, [])

func turn_ended():
	if turn >= player_count:
		turn = 1
	else: 
		turn = turn +1
	if turn in dead:
		turn_ended()

func remove_moves(Graph):
	for move in highlighted_moves:
		Graph.get_node("Node"+str(move)).highlight_node(false)
	highlighted_moves = []

func set_moves(Graph, node):
	highlighted_moves = map[node]
	for move in highlighted_moves:
		Graph.get_node("Node"+str(move)).highlight_node(true)
func kill(node):
	dead.append(node)
	alive = alive -1
