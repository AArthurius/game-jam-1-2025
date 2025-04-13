extends item

func inicializar(): 
	nome = "frutinha"
	copy = preload("res://Scenes/itens/frutinha.tscn")
	usable = true

func useItem(player):
	player.bonusSpeed += 10000
	player.resetBonus.set_wait_time(2)
	player.resetBonus.start()
