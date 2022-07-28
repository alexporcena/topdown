extends KinematicBody2D

onready var personagem = get_parent().get_parent().get_node("Personagem")
var movimento = Vector2.ZERO
var perseguir = false
var life = 2

func _physics_process(delta):
	
	if movimento == Vector2.ZERO:
		$AnimationPlayer.play("parado")
	else:
		$AnimationPlayer.play("andando")
	
	if perseguir:
		movimento = (personagem.get_global_position() - position).normalized()
		movimento = move_and_slide(movimento * 30)

	look_at(personagem.get_global_position())
	
	if $RayCast2D.is_colliding() && $RayCast2D.get_collider() is Personagem:
		perseguir = true
	else:
		perseguir = false

func _on_Area2D_body_entered(body):
	if body.is_in_group("projetil"):
		
		life -= 1
		
		body.queue_free()
		
		if life == 0:
			var sangue = Sprite.new()
			sangue.texture = load("res://assets/imagens/blood.png")
			sangue.position = get_global_position()
			get_parent().get_parent().get_node("Sangue").add_child(sangue)
			queue_free()
	elif body is Personagem:
		body.perde_vida()
