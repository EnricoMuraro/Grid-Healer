class_name Ability
extends Resource

@export var name : String
@export var effect: PackedScene

@export var mana_cost: Stat
@export var cast_time: Stat
@export var cooldown: Stat

func activate():
	return effect.instantiate()
