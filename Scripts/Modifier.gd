class_name Modifier
extends Resource

enum Type {FLAT, PERCENTAGE}
@export var type : Modifier.Type
@export var value : float

static func calculate_modifiers(starting_value, modifiers:Array[Modifier]):
	var flat_amount = 0
	var percentage_amount = 0
	for mod in modifiers:
		if(mod.type == Modifier.Type.FLAT):
			flat_amount += mod.value
		if(mod.type == Modifier.Type.PERCENTAGE):
			percentage_amount += mod.value
			
	return (starting_value + flat_amount) + (starting_value + flat_amount) * percentage_amount / 100
