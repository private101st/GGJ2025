extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func getText(id):
	var eventid = Level.levelid
	text = Evetlist.events[int(eventid)-1]["options"][int(id)-1]["desc"]
	set_text(text)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_ready(extra_arg_0):
	pass # Replace with function body.
