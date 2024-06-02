extends Node3D

@onready var arm := $ArmTest
@onready var item := arm.get_node("Armature/Skeleton3D/InventoryItem")

@onready var demon:= $gobble_monster

@onready var ui := $BaseUI
var cyc_r_butt : Button
var cyc_l_butt : Button


# Called when the node enters the scene tree for the first time.
func _ready():
	cyc_r_butt = ui.r_button
	cyc_r_butt.button_up.connect(cycle_right)
	
	cyc_l_butt = ui.l_button
	cyc_l_butt.button_up.connect(cycle_left)

func cycle_right():
	arm.move_arm() #play animation
	if demon != null:
		demon.open_mouth() #play mouth opening animation 
	item.load_next(1) #prepare new item for when animation calls
	
#inv of cycle_right
func cycle_left():
	arm.move_arm()
	if demon != null:
		demon.open_mouth() #play mouth opening animation 
	item.load_next(-1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#only one way, need to update control scheme to go two ways
	if Input.is_action_just_pressed("cycle-l"):
		cycle_left()
	
	if Input.is_action_just_pressed("cycle-r"):
		cycle_right()
