extends Node3D

@onready var _animator := $"AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("Cycle"):
		print("ok")
		_animator.play("ArmatureAction")
