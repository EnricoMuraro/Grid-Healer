extends Node2D

@export var abilities = []

@export var testability = preload("res://healing_wave.tscn")

func activate_ability():
	var instance = testability.instantiate()
	add_child(instance)


