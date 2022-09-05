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
		#movimento = (personagem.get_global_position() - position)
		#movimento = move_and_slide(movimento)
		movimento = position.direction_to(personagem.position)
	else:
		movimento = Vector2.ZERO
		
	look_at(personagem.position)
		
	movimento = movimento.normalized()
	movimento *= 45
		
	move_and_slide(movimento)
	
	if $RayCast2D.is_colliding() && $RayCast2D.get_collider() is Personagem:
		perseguir = true
	else:
		perseguir = false

func _on_Area2D_body_entered(body):
	if body.is_in_group("projetil"):
		$AudioMorrer.play()
		$CollisionInimigo.queue_free()
		$Area2D/CollisionArea.queue_free()
		$AnimationPlayer.stop(true)
		set_physics_process(false)
		var sangue = Sprite.new()
		sangue.texture = load("res://assets/imagens/blood.png")
		sangue.position = get_global_position()
		get_parent().get_parent().get_node("Sangue").add_child(sangue)
		body.queue_free()
	elif body is Personagem:
		body.perde_vida()


func _on_AudioMorrer_finished():
	queue_free()
