extends Node2D

var spheres = {}
var labels = {}
var event_labels = {}  # Aggiungi un dizionario per memorizzare i label degli eventi
var events = [
	{"name": "Volcanic eruption", "sphere": "Climate", "effects": {"temperature": 1, "precipitation": -2}}, 
	{"name": "New discovery", "sphere": "Technology", "effects": {"progress": 1.5}},
	{"name": "Social crisis", "sphere": "Social climate", "effects": {"tension": 3, "stability": -2}},
	{"name": "Flood", "sphere": "Climate", "effects": {"precipitation": 3}},
	{"name": "War", "sphere": "International stability", "effects": {"peace": -4, "conflicts": 5}},
	{"name": "Drought", "sphere": "Climate", "effects": {"temperature": 0.5, "precipitation": -3}},
	{"name": "Researcher dies", "sphere": "Technology", "effects": {"research": -0.5}},
	{"name": "Conspiracy theorists", "sphere": "Social climate", "effects": {"tension": 1.5}},
	{"name": "Tornado", "sphere": "Climate", "effects": {"precipitation": 1}},
	{"name": "Politician slip-up", "sphere": "Bubble awareness", "effects": {"percentage": 0.5}},
	{"name": "Revolution", "sphere": "Social climate", "effects": {"stability": -5, "tension": 5}},
	{"name": "Inflation", "sphere": "Economy", "effects": {"inflation": 0.05}},
	{"name": "Recruitment of soldiers", "sphere": "Power", "effects": {"soldiers": 5}},
	{"name": "International agreements", "sphere": "International stability", "effects": {"peace": 3}},
	{"name": "Climate crisis", "sphere": "Climate", "effects": {"temperature": 0.8, "precipitation": -2.5}},
	{"name": "Frost", "sphere": "Climate", "effects": {"temperature": -1}},
	{"name": "Coup", "sphere": "Social climate", "effects": {"stability": -7, "tension": 7}},
	{"name": "Document loss", "sphere": "Technology", "effects": {"research": -1}},
	{"name": "Researcher theory", "sphere": "Bubble awareness", "effects": {"percentage": 1}}
]

func _ready():
	randomize()
	generate_initial_state()
	create_ui()

func generate_initial_state():
	spheres = {
		"Climate": {
			"temperature": floor(randf_range(-1, 4) * 10) / 10,
			"precipitation": floor(randf_range(0, 10) * 10) / 10
		},
		"Technology": {
			"progress": floor(randf_range(0, 5) * 10) / 10,
			"research": floor(randf_range(0, 2) * 10) / 10
		},
		"Social climate": {
			"tension": floor(randf_range(0, 10) * 10) / 10,
			"stability": floor(randf_range(0, 10) * 10) / 10
		},
		"International stability": {
			"peace": floor(randf_range(0, 10) * 10) / 10,
			"conflicts": floor(randf_range(0, 10) * 10) / 10
		},
		"Economy": {
			"inflation": floor(randf_range(0.0, 1.0) * 10) / 10,
			"growth": floor(randf_range(-0.5, 1.0) * 10) / 10
		},
		"Bubble resistance": {
			"efficacy": floor(randf_range(0, 10) * 10) / 10
		},
		"Bubble awareness": {
			"percentage": floor(randf_range(0, 10) * 10) / 10
		},
		"Power": {
			"soldiers": floor(randf_range(1, 100) * 10) / 10
		}
	}

func create_ui():
	var grid = $GridContainer  
	for sphere_name in spheres.keys():
		var hbox = HBoxContainer.new()
		grid.add_child(hbox)
		
		var sphere_label = Label.new()
		sphere_label.text = sphere_name
		hbox.add_child(sphere_label)
		
		var values_label = Label.new()
		values_label.text = str(spheres[sphere_name])
		labels[sphere_name] = values_label
		hbox.add_child(values_label)
	
	# Crea un secondo GridContainer per l'output dell'evento
	var event_grid = $EventGridContainer
	var event_label = Label.new()
	event_label.text = "No event yet"
	event_labels["event"] = event_label
	event_grid.add_child(event_label)

func apply_random_event():
	var event = events[randi() % events.size()]
	var sphere = event["sphere"]
	var effects = event["effects"]
	
	# Stampa l'evento che viene eseguito nella label dell'evento
	var event_text = "Event: " + event["name"] + "\n"
	event_text += "Sphere: " + sphere + "\n"
	event_text += "Effects: " + str(effects)
	
	# Mostra il testo nell'EventGridContainer
	event_labels["event"].text = event_text
	
	# Applicazione degli effetti
	for key in effects:
		if key in spheres[sphere]:
			spheres[sphere][key] += effects[key]
	_update_ui()

func _update_ui():
	for sphere_name in spheres.keys():
		labels[sphere_name].text = str(spheres[sphere_name])

func _on_events_pressed():
	apply_random_event()
	print("\nState after event:", spheres)
