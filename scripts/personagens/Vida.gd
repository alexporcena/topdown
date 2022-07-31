extends Area2D

func _on_Vida_body_entered(body):
	if body is Personagem:
		body.ganha_vida()
		queue_free()
