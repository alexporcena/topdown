extends CanvasLayer

func altera_vida(vidas):
	$Vidas.value = vidas

func altera_projetil(projeteis):
	$Label.text = String(projeteis)
