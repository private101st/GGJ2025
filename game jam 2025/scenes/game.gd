extends Node2D

var spheres = {}
var button : Button  
func generate_initial_state():
	spheres = {
		"Climate": {
			 "temperature": floor(randf_range(-10, 40) * 100) / 100,            "precipitation": floor(randf_range(0, 100) * 100) / 100
		},
		"Technology": {
			"progress": floor(randf_range(0, 50) * 100) / 100,            "research": floor(randf_range(0, 20) * 100) / 100
		},
		"Social climate": {
			"tension": floor(randf_range(0, 100) * 100) / 100,            "stability": floor(randf_range(0, 100) * 100) / 100
		},
		"International stability": {
			"peace": floor(randf_range(0, 100) * 100) / 100,            "conflicts": floor(randf_range(0, 100) * 100) / 100
		},
		"Economy": {
			"inflation": floor(randf_range(0.0, 10.0) * 100) / 100,            "growth": floor(randf_range(-5.0, 10.0) * 100) / 100
		},
		"Bubble resistance": {
			"efficacy": floor(randf_range(0, 100) * 100) / 100
		},
		"Bubble awareness": {
			"percentage": floor(randf_range(0, 100) * 100) / 100
		},
		"Power": {
			"soldiers": floor(randf_range(10, 1000) * 100) / 100
		}
	}
	
func apply_random_event():
	var event = events[randi() % events.size()]
	var sphere = event["sphere"]
	var effects = event["effects"]
	for key in effects:
		if key in spheres[sphere]:
			spheres[sphere][key] += effects[key]
			print("Event applied:", event["name"], "| Sphere:", sphere, "| Effects:", effects)
var events = [
	{"name": "Volcanic eruption", "sphere": "Climate", "effects": {"temperature": 10, "precipitation": -20}},    {"name": "New discovery", "sphere": "Technology", "effects": {"progress": 15}},
	{"name": "Social crisis", "sphere": "Social climate", "effects": {"tension": 30, "stability": -20}},    {"name": "Flood", "sphere": "Climate", "effects": {"precipitation": 30}},
	{"name": "War", "sphere": "International stability", "effects": {"peace": -40, "conflicts": 50}},    {"name": "Drought", "sphere": "Climate", "effects": {"temperature": 5, "precipitation": -30}},
	{"name": "Researcher dies", "sphere": "Technology", "effects": {"research": -5}},    {"name": "Conspiracy theorists", "sphere": "Social climate", "effects": {"tension": 15}},
	{"name": "Tornado", "sphere": "Climate", "effects": {"precipitation": 10}},    {"name": "Politician slip-up", "sphere": "Bubble awareness", "effects": {"percentage": 5}},
	{"name": "Revolution", "sphere": "Social climate", "effects": {"stability": -50, "tension": 50}},    {"name": "Inflation", "sphere": "Economy", "effects": {"inflation": 0.5}},
	{"name": "Recruitment of soldiers", "sphere": "Power", "effects": {"soldiers": 50}},    {"name": "International agreements", "sphere": "International stability", "effects": {"peace": 30}},
	{"name": "Climate crisis", "sphere": "Climate", "effects": {"temperature": 8, "precipitation": -25}},    {"name": "Frost", "sphere": "Climate", "effects": {"temperature": -10}},
	{"name": "Coup", "sphere": "Social climate", "effects": {"stability": -70, "tension": 70}},
	{"name": "Document loss", "sphere": "Technology", "effects": {"research": -10}},    {"name": "Researcher theory", "sphere": "Bubble awareness", "effects": {"percentage": 10}}
]
func _ready():
	randomize()
	generate_initial_state()
	print("Initial state:", spheres)
	#button = $Button  # Ensure that the button exists in your scene as a child of this node.
	#if button:  # Check if the button is not null
	#	button.connect("pressed", self, "_on_Button_pressed")
	#else:
	#	print("Error: Button node not found.")


func _on_events_pressed() -> void:
	apply_random_event()
	print("\nState after event:", spheres)
