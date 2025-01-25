extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	#var button = Button.new()
	#button.text = "Click me"
	#button.pressed.connect(self._button_pressed)
	#add_child(button)
	pass
func _button_pressed(id):
	Evetlist.trigger_event(id)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed(id):
	Evetlist.trigger_event(id) # Replace with function body.
