extends CanvasLayer
class_name UI

@onready var r_button = $Screen/r_cycle_button
@onready var l_button = $Screen/l_cycle_button

# Called when the node enters the scene tree for the first time.
func _ready():
	r_button.text = "Cycle Right"
	l_button.text = "Cycle Left"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
