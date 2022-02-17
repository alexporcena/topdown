extends Area2D

func _on_PackMunicao_body_entered(body):
	if body is Personagem:
		body.recarrega_arma()
		queue_free()
