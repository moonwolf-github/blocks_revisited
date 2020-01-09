extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
    set_sleeping(true)
    # apply_central_impulse(Vector2(50, -150))

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_MainScreen_swipe(swipe):
    if is_sleeping():
        apply_central_impulse(swipe)