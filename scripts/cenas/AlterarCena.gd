extends Area2D

export var cena = String()

func _on_AlterarCena_body_entered(body):
	if body is Personagem:
		get_tree().change_scene(cena)
