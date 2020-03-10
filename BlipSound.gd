extends AudioStreamPlayer

func _on_Player1_body_entered(body):
    print("weszedłem")
    if not body.is_in_group("enemy"):
        play()


func _on_Player1_touch(body):
    print("weszedłem")
    if not body.is_in_group("enemy"):
        play()
