extends TextureProgressBar

var unit: GameUnit

func _ready():
	unit = owner.get_node("GameUnit")
	
	
func _on_game_unit_health_changed(_old_value, new_value):
	if unit != null:
		max_value = unit.max_health.get_value()
		value = new_value
	
