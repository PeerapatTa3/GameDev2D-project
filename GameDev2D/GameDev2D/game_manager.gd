extends CanvasLayer
class_name GameManager

var player : Player
var playerHP : float
var playerMaxHP : float

func _ready() -> void:
	pass	

func _process(delta: float) -> void:
	if player:
		playerMaxHP = player.get_node("HealthComponent").MAX_HP
		playerHP = player.get_node("HealthComponent").HP
	elif !player:
		player = GameStat.player
	$ProgressBar.value = playerHP*100/playerMaxHP
	$Label.text = str(playerHP)
	$Label2.text = str(": ",+GameStat.coin)
