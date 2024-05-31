extends Area2D

class_name Objects

@export var horizontal_speed = 0
@export var vertical_speed = 35

func _ready():
	set_process(true)

func _process(delta):
	position.y += delta * vertical_speed
	
func _on_area_entered(area):
	var ui = get_tree().root.get_node("Main/game/Ui")  # Move a declaração da variável ui para um escopo mais amplo
	if self.name == Global.nome_objeto:
		print("objeto correto")
		if ui:
			ui.update_score(10)  # Adiciona 10 pontos para o objeto correto
		queue_free()
	else: 
		print("objeto errado")
		Global.lives -= 1
		if Global.lives <= 0:
			if ui:
				ui.update_lives(Global.lives)
		else:
			if ui:
				ui.update_lives(Global.lives)
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
