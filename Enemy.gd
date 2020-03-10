extends KinematicBody2D

var acceleration = Vector2()
signal touch

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

func _physics_process(delta):
    move_and_slide(acceleration)
    # check if there is a collision:
    if get_slide_count() > 0:
        var collision = get_slide_collision(0)
        if collision != null:
            if collision.get_collider().is_in_group("player"):
                queue_free()
            else:
                emit_signal("touch", collision.get_collider())
                acceleration = acceleration.bounce(collision.normal)
