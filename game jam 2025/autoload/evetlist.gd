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

var world_state = {
	"science": 0,
	"economy": 0,
	"cimate": 1000
}

# Called when the node enters the scene tree for the first time.
func _ready():
	world_state["science"] = 0;
	world_state["economy"] = 50;
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
	print("ok")
	var index = -1
	for x in events:
		index += 1
		if x["id"] == id:
			#index = index
			break
	#var _num_options = events[index].count
	
	for x in events[index]["options"]:
		print(x["title"])
		print(x["desc"])
		
