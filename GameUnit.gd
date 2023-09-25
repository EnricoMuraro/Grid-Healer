extends Node2D

@export var stats: CharacterStats
@onready var hurtbox := $Hurtbox
@onready var healbox := $Healbox

@onready var current_health : int = stats.max_health

signal health_changed(old_value, new_value)

func _ready():
	healbox.heal_received.connect(receive_heal)
	hurtbox.damage_received.connect(receive_damage)

func receive_damage(amount:int):
	current_health -= amount
	print("damage taken ", amount)
	
func receive_heal(amount:int):
	current_health += amount
	print("heal received ", amount)
	
	
