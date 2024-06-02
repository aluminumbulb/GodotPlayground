extends Node3D

@onready var _animator := $"AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

#bound to:
func move_arm():
	_animator.play("ArmatureAction")
