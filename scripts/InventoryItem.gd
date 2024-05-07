extends Node3D
class_name InventoryItem

@export var possible_items: Array[ItemDescription]
var curr_item : ItemDescription
var curr_mesh:Mesh

var i:=0
func refresh(item_desc: ItemDescription):
	#set mesh in child
	get_node("objMesh").mesh = item_desc.mesh
	
# Called when the node enters the scene tree for the first time.
func _ready():
	curr_item = possible_items[0]
	refresh(curr_item)

#shifts to the next inventory slot
func cycle():
	i=(i+1)%possible_items.size()
	print(i)
	curr_item = possible_items[i]
	refresh(curr_item)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Instead of input lets try to use some animation thing
	if Input.is_action_just_pressed("Cycle"):
		cycle()	
