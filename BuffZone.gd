extends Node2D

@onready var hitbox := $Hitbox

@export var armor_modifier := Modifier.new().initialize(100, Modifier.Type.FLAT)
@export var magic_resistance_modifier := Modifier.new().initialize(100, Modifier.Type.FLAT)

func _ready():
	hitbox.area_entered.connect(on_entered)
	hitbox.area_exited.connect(on_exited)
	
func on_entered(area):
	var target = area.owner.unit #sus
	if target is GameUnit:
		target.armor.modifiers.append(armor_modifier)
		target.magic_resistance.modifiers.append(magic_resistance_modifier)
		
func on_exited(area):
	var target = area.owner.unit
	if target is GameUnit:
		target.armor.modifiers.erase(armor_modifier)
		target.magic_resistance.modifiers.erase(magic_resistance_modifier)
