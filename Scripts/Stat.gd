class_name Stat
extends Resource

@export var base_value: float
@export var modifiers : Array[Modifier]

func get_value(): 
	return maxf(0, Modifier.calculate_modifiers(base_value, modifiers))

func add_modifier(amount, type: Modifier.Type):
	modifiers.append(Modifier.new().initialize(amount, type))

func remove_modifier(mod: Modifier):
	modifiers.erase(mod)
	
func copy():
	var new_copy = Stat.new()
	new_copy.base_value = base_value
	for modifier in modifiers:
		new_copy.modifiers.append(Modifier.new().initialize(modifier.value, modifier.type))
	return new_copy
#func clear_modifiers():
#	modifiers.clear()
