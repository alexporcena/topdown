extends Control

func _on_ButtonJogar_pressed():
	get_tree().change_scene("res://cenas/fases/PrimeiraFase.tscn")

func _on_ButtonSair_pressed():
	get_tree().quit()
