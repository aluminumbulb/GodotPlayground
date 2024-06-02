extends Sprite3D

@onready var _animator := $"AnimationPlayer"

func open_mouth():
	_animator.play("open_mouth")
	get_node("gm_aud").play()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
