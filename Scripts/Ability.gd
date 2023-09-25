class_name Ability
extends Resource

@export var mana_cost: int:
	get:
		return (int)(Modifier.calculate_modifiers(mana_cost, mana_cost_modifiers))
		
var mana_cost_modifiers : Array[Modifier]


@export var cast_time: int:
	get:
		return (int)(Modifier.calculate_modifiers(cast_time, cast_time_modifiers))
		
var cast_time_modifiers : Array[Modifier]


