extends Node2D

onready var AlterarCena = preload("res://cenas/fases/AlterarCena.tscn")
var fase_finalizada = false
var cursor = preload("res://assets/imagens/alvo.png")

func _ready():
	Input.set_custom_mouse_cursor(cursor)

func _physics_process(delta):
	if conta_inimigos() == 0 and fase_finalizada == false:
		var alterar_cena_instancia = AlterarCena.instance()
		alterar_cena_instancia.position = $Position2DTrocaFase.position
		alterar_cena_instancia.cena = "res://cenas/fases/PrimeiraFase.tscn"
		add_child(alterar_cena_instancia)
		fase_finalizada = true
		
func conta_inimigos():
	return $Inimigos.get_child_count()
