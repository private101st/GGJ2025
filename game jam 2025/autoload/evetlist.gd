extends Node

var events =[
	{
		"id":"1",
		"title": "vulcano",
		"descrition": "esplode um vulcNO",
		"num_opzioni" : 2,
		"options":[
			{
				"id": "1.1",
				"title": "non fare niente",
				"desc": "stai a guardare",
				"world_update":{
					"cimate":-10
				}
			},
			{
				"id": "1.2",
				"title": "fai qualcosa",
				"desc": "in realtà non fai niente lo stesso",
				"world_update":{
					"climate":-5
				}
			},
			{
				"id": "1.3",
				"title": "ND",
				"desc": "ND"
			}
		]
	},
		{
		"id":"2",
		"title": "scientific research",
		"descrition": "you made a discovery in ...",
		"options":[
			{
				"id": "2.1",
				"title": "wow",
				"desc": "eccheccazzo"
			},
			{
				"id": "2.2",
				"title": "ajooo",
				"desc": "fanculo"
			}
		]
	},
] 
#var options = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#var delta_total = 0;

# Called every frame. 'deldeltta' is the elapsed time since the previous frame.
func _process(delta):
	#delta_total += delta;
	#if delta_total > 10000:
		#delta_total = 0
		#trigger_event(1);
	pass
func trigger_event(id):
	var index = -1
	for x in events:
		index += 1
		if x["id"] == id:
			#index = index    ### mi trova l'indice dell'evento cercato
				
			get_tree().change_scene_to_file("res://scenes/event.tscn")
			
			
			#Buttontext.getText(index, events[index]["options"])
			break

	#var _num_options = events[index].count
	
	#for x in events[index]["options"]:
	#	print(x["title"])
	#	print(x["desc"])
func trigger_option(eventindex, id):
	return events[eventindex]["options"][id]["desc"]
