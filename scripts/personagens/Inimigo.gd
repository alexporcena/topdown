extends KinematicBody2D

onready var personagem = get_parent().get_parent().get_node("Personagem")
var movimento = Vector2.ZERO
var perseguir = false

func _physics_process(delta):
	
	if movimento == Vector2.ZERO:
		$AnimationPlayer.play("parado")
	else:
		$AnimationPlayer.play("andando")
	
	if perseguir:
		movimento = (personagem.get_global_position() - position)
		movimento = move_and_slide(movimento)

	look_at(personagem.get_global_position())
	
	if $RayCast2D.is_colliding() && $RayCast2D.get_collider() is Personagem:
		perseguir = true
	else:
		perseguir = false

func _on_Area2D_body_entered(body):
	if body.is_in_group("projetil"):
		queue_free()
		body.queue_free()
