extends Node3D
class_name InventoryItem

#list of possible items
@export var possible_items: Array[ItemDescription]
#persistant placeholder in item array
var i:=0

#desired item representation
var curr_item : ItemDescription
#placeholder to allow mesh loading without instantly displaying
var curr_mesh:Mesh
var curr_desc: Label

var animator: AnimationPlayer
var rand: RandomNumberGenerator

@onready var timer:= $"shuffle_period"

#changes item to reflect selected description
func refresh(item_desc: ItemDescription):	
	#set mesh
	get_node("objMesh").mesh = item_desc.mesh
	
	#load in more sound
	get_node("audio").stream = item_desc.sound
	curr_desc.text = curr_item.description

# Called when the node enters the scene tree for the first time.
func _ready():
	curr_item = possible_items[0]
	#really not good, but short term fine
	curr_desc = get_tree().get_root().get_node("main/BaseUI/Screen/desc_label")
	refresh(curr_item)
	
	#WARNING: Gross, I need to avoid this in the future
	animator = get_parent().get_parent().get_parent().get_node("AnimationPlayer")
	
	rand = RandomNumberGenerator.new()
	rand.randomize()

#shifts to the next inventory slot
func cycle():
	iterate()

func iterate():
	animator.pause()
	await timer.timeout
	print("iterating")
	if Input.is_action_pressed("cycle-l"):
		#linear_pick(-1)
		rand_pick()
		refresh(curr_item)
		play_sting()
		iterate()#call itself for recursion
			
	elif Input.is_action_pressed("cycle-r"):
		#linear_pick(1)
		rand_pick()
		refresh(curr_item)
		play_sting()
		iterate()#call itself for recursion
	
	else:
		animator.play()

#cycles linearly through list of items (nts: list traversals)
func linear_pick(dir : int):
	print("linearly picking")
	i=(i+dir)%possible_items.size()
	print(i)
	curr_item = possible_items[i]
	
func rand_pick():
	i = rand.randi_range(0,(possible_items.size()-1))
	curr_item = possible_items[i]

#staging area for loading methods
func load_next(dir : int):
	linear_pick(dir)

func play_sting():
	get_node("audio").play()
