extends Node2D

@export var abilities : Array[Ability]
var cooldowns := {}

func _ready():

	for ability in abilities:
		var timer = Timer.new()
		timer.one_shot = true
		add_child(timer)
		cooldowns[ability] = timer
		
func activate_ability(index):
	if index >= abilities.size() or abilities[index] == null:
		print("no abilities in slot %s" %index)
		return
		
	var ability = abilities[index]
	var timer = cooldowns[abilities[index]] as Timer
	
	if timer.is_stopped():
		var instance = ability.activate()
		add_child(instance)
		timer.start(ability.cooldown.get_value())
	else:
		print("%s is on cooldown for another %s seconds" %[ability.name,timer.time_left])
		return
		


