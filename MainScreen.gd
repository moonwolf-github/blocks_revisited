extends Node2D

signal swipe
var swipe_start = null
var minimum_drag = 10

func _unhandled_input(event):
    if event.is_action_pressed("click"):
        swipe_start = get_viewport().get_mouse_position()
    if event.is_action_released("click"):
        _calculate_swipe(get_viewport().get_mouse_position())
        
func _calculate_swipe(swipe_end):
    if swipe_start == null: 
        return
    var swipe = swipe_end - swipe_start
    if abs(swipe.x) > minimum_drag:
        if swipe.x > 0:
            emit_signal("swipe", swipe)
        else:
            emit_signal("swipe", swipe)

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
