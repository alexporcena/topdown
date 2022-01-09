extends KinematicBody2D

class_name Personagem

const VELOCIDADE = 50
const VELOCIDADE_PROJETIL = 200
onready var Projetil = preload("res://cenas/armas/Projetil.tscn")

func _physics_process(delta):
	
	var direcao = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		direcao.y = -1
	if Input.is_action_pressed("ui_down"):
		direcao.y = 1
	if Input.is_action_pressed("ui_left"):
		direcao.x = -1
	if Input.is_action_pressed("ui_right"):
		direcao.x = 1
	
	direcao = direcao.normalized()
	
	if direcao == Vector2.ZERO:
		$AnimationPlayer.play("parado")
	else:
		$AnimationPlayer.play("andando")

	direcao = move_and_slide(direcao * VELOCIDADE)
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("atirar"):
		atirar()

func atirar():
	var projetil = Projetil.instance()
	projetil.position = $Position2D.get_global_position()
	projetil.rotation_degrees = rotation_degrees
	projetil.apply_impulse(Vector2.ZERO, Vector2(VELOCIDADE_PROJETIL, 0).rotated(rotation) )
	get_parent().add_child(projetil)
