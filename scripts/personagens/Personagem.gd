extends KinematicBody2D

const VELOCIDADE = 50

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
