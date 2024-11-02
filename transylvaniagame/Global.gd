# Global.gd
extends Node

var player_count: int = 0
var map = {
	1:[2,5,13],
	2:[1,4],
	3:[1,4],
	4:[2,3]
}
var turn = 1

func get_connected(node):
	return map.get(node, [])

func turn_ended():
	if turn >= player_count:
		turn = 0
	else: 
		turn = turn +1
