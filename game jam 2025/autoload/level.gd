extends Node

var levelid = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	print('ciao')
	pass # Replace with function body.
func changelevel(id):
	Level.levelid = id
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
