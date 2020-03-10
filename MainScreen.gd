extends Node2D

signal swipe
var swipe_start = null
var minimum_drag = 10
export (PackedScene) var Enemy
export (PackedScene) var Explosion
var dragging = false

func _unhandled_input(event):
    #$Label.text = event.get_class() + ": " + str(event.is_pressed())
    if event is InputEventScreenTouch:
        if event.is_pressed():
            swipe_start = event.position
        else:
            _calculate_swipe(event.position)
        
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
    var e1 = Enemy.instance()
    e1.position = Vector2(50, 50)
    add_child(e1)
    e1.acceleration = Vector2(150, 20)
    print("gotowy")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Player1_kill_enemy(body):
    var explosion = Explosion.instance()
    explosion.position = body.position
    explosion.get_node("Animation").play("Blast")
    add_child(explosion)
