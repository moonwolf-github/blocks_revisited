extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_bounce(1)
	set_friction(0)
	apply_central_impulse(Vector2(50, -150))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
