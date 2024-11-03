# Global.gd
extends Node

var player_count: int = 0
#var map = {
	#10: [11, 20],
	#11: [10, 12, 21],
	#12: [11, 13, 22],
	#13: [12, 14, 23],
	#14: [13, 15, 24],
	#15: [14, 16, 25],
	#16: [15, 17, 26],
	#17: [16, 18, 27],
	#18: [17, 19, 28],
	#19: [18, 29, 70],
	#70: [19, 71],
#
	#20: [10, 21, 30],
	#21: [11, 20, 22, 31],
	#22: [12, 21, 23, 32],
	#23: [13, 22, 24, 33],
	#24: [14, 23, 25, 34],
	#25: [15, 24, 26, 35],
	#26: [16, 25, 27, 36],
	#27: [17, 26, 28, 37],
	#28: [18, 27, 29, 38],
	#29: [19, 28, 39, 71],
	#71: [29, 70, 72],
#
	#30: [20, 31, 40],
	#31: [21, 30, 32, 41],
	#32: [22, 31, 33, 42],
	#33: [23, 32, 34, 43],
	#34: [24, 33, 35, 44],
	#35: [25, 34, 36, 45],
	#36: [26, 35, 37, 46],
	#37: [27, 36, 38, 47],
	#38: [28, 37, 39, 48],
	#39: [29, 38, 49, 72],
	#72: [39, 71, 73],
#
	#40: [30, 41, 50],
	#41: [31, 40, 42, 51],
	#42: [32, 41, 43, 52],
	#43: [33, 42, 44, 53],
	#44: [34, 43, 45, 54],
	#45: [35, 44, 46, 55],
	#46: [36, 45, 47, 56],
	#47: [37, 46, 48, 57],
	#48: [38, 47, 49, 58],
	#49: [39, 48, 59, 73],
	#73: [49, 72, 74],
#
	#50: [40, 51, 60],
	#51: [41, 50, 52, 61],
	#52: [42, 51, 53, 62],
	#53: [43, 52, 54, 63],
	#54: [44, 53, 55, 64],
	#55: [45, 54, 56, 65],
	#56: [46, 55, 57, 66],
	#57: [47, 56, 58, 67],
	#58: [48, 57, 59, 68],
	#59: [49, 58, 69, 74],
	#74: [59, 73, 75],
#
	#60: [50, 61],
	#61: [51, 60, 62],
	#62: [52, 61, 63],
	#63: [53, 62, 64],
	#64: [54, 63, 65],
	#65: [55, 64, 66],
	#66: [56, 65, 67],
	#67: [57, 66, 68],
	#68: [58, 67, 69],
	#69: [59, 68, 75],
	#75: [69, 74]
#}
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
	11:[10,12,13,14],
	12:[11,13],
	13:[10,11,12],
	14:[11]
}

## 11 and 13
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

var transylvania_table = {
	1:[1.00,0.90,0.75,0.50,0.25,0.10],
	2:[0.10,1.00,0.90,0.75,0.50,0.25],
	3:[0.25,0.10,1.00,0.90,0.75,0.50],
	4:[0.50,0.25,0.10,1.00,0.90,0.75],
	5:[0.75,0.50,0.25,0.10,1.00,0.90],
	6:[0.90,0.75,0.50,0.25,0.10,1.00]
}


func reset():
	turn = 1
	highlighted_moves = []
	dead = []
	alive = -1
	roles = {
		1:"Dracula",
		2:"Frankenstein",
		3:"Murray",
		4:"Wayne",
		5:"Griffin",
		6:"Blobby"
	}
	player_roles = {}
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
		print("NODE")
		print(node)
		print("SAFETY")
		print(Graph.get_node("Node"+str(move)).get_safety())
		print("MOVE")
		print(move)
		if Graph.get_node("Node"+str(move)).get_safety() != node:
			Graph.get_node("Node"+str(move)).highlight_node(true)
	
func kill(node):
	dead.append(node)
	alive = alive -1
