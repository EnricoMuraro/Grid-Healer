class_name GameUnit
extends Node2D

@onready var hurtbox := $Hurtbox
@onready var healbox := $Healbox

signal health_changed(old_value, new_value)

var max_health: Stat
var armor: Stat
var magic_resistance: Stat
var strength: Stat
var intellect: Stat

func set_stats(stats: CharacterStats):
	max_health = stats.max_health.copy()
	armor = stats.armor.copy()
	magic_resistance = stats.magic_resistance.copy()
	strength = stats.strength.copy()
	intellect = stats.intellect.copy()
	current_health = max_health.get_value()
		
var current_health: int:
	set(value):
		value = clampi(value, 0, max_health.get_value())
		health_changed.emit(current_health, value)
		current_health = value
		
func _ready():
	healbox.heal_received.connect(receive_heal)
	hurtbox.damage_received.connect(receive_damage)

func receive_damage(damage: DamageInstance):
	var reduced_damage = 0
	if damage.type == DamageInstance.Type.PHYSICAL:
		reduced_damage = damage.amount * (100/(float)(100+armor.get_value()))
	if damage.type == DamageInstance.Type.MAGIC:
		reduced_damage = damage.amount * (100/(float)(100+magic_resistance.get_value()))
		
	current_health -= reduced_damage
	print("damage taken ", reduced_damage)
	
func receive_heal(amount: int):
	var old_health = current_health
	current_health += amount
	health_changed.emit(old_health, current_health)
	print("heal received ", amount)
	
