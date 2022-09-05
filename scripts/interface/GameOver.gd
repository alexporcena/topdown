extends Control

var cursor = preload("res://assets/imagens/alvo.png")

func _ready():
	Input.set_custom_mouse_cursor(null)

func _on_ButtonJogar_pressed():
	get_tree().change_scene("res://cenas/fases/PrimeiraFase.tscn")

func _on_ButtonMenu_pressed():
	get_tree().change_scene("res://cenas/interface/Menu.tscn")

func _on_ButtonSair_pressed():
	get_tree().quit()

func _on_Button_mouse_entered():
	Input.set_custom_mouse_cursor(cursor)

func _on_Button_mouse_exited():
	Input.set_custom_mouse_cursor(null)
