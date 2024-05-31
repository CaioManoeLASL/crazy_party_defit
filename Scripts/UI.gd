extends CanvasLayer

class_name UI

@onready var game_over_center = $Control/MarginContainer/CenterContainer
@onready var objeto_correto_label = %objetoCorreto
@onready var score_label = %ScoreLabel
var heart_textures: Array = []  # Array para armazenar as texturas dos corações
var hearts: Array = []  # Array para armazenar os TextureRect dos corações

func _ready():
	game_over_center.visible = false
	# Carrega as texturas dos corações
	for i in range(5):  # Supondo que você tem 5 vidas
		var texture = load("res://Assets/Sprites/SpritesSheet.sprites/corazao.png")  # Caminho para a textura do coração
		heart_textures.append(texture)
		# Cria um TextureRect para cada coração e define a textura
		var heart = TextureRect.new()
		heart.texture = texture
		# Define a escala do TextureRect para corresponder ao tamanho da textura
		heart.scale = Vector2.ONE * 0.5  # Ajuste a escala conforme necessário para o tamanho desejado
		hearts.append(heart)
		$Control/MarginContainer/HBoxContainer.add_child(heart)  # Adiciona o TextureRect ao HBoxContainer

func set_label(nome_objeto: String):
	objeto_correto_label.text = nome_objeto

func update_score(pontos: int):
	Global.points += pontos
	score_label.text = str(Global.points)

func update_lives(vidas: int):
	Global.lives = vidas
	# Atualiza a visibilidade dos corações para refletir o número de vidas restantes
	for i in range(5):  # Supondo que você tem 5 vidas
		if i < Global.lives:
			hearts[i].visible = true
		else:
			hearts[i].visible = false
		
	if Global.lives <= 0:
		game_over_center.visible = true
