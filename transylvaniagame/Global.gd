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
	11:[12,14],
	12:[11],
	13:[10,12],
	14:[11]
}
var turn = 1

func get_connected(node):
	return map.get(node, [])

func turn_ended():
	if turn >= player_count-1:
		turn = 0
	else: 
		turn = turn +1
