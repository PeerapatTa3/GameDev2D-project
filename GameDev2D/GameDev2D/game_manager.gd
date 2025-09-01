extends CanvasLayer
class_name GameManager

func _process(delta: float) -> void:
	$Label.text = str(GameStat.playerHP)
	$Label2.text = str(GameStat.coin)
