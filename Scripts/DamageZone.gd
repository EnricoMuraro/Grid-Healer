extends Node2D

@export var damage := 5
@export var damage_type := DamageInstance.Type.MAGIC
@export var cooldown := 1

@onready var hitbox := $Hitbox
@onready var cooldown_timer := $Timer


func _ready():
	cooldown_timer.timeout.connect(apply_damage)
func apply_damage():
	var damage_instance = DamageInstance.new(damage, damage_type)
	var targets = hitbox.get_overlapping_areas()
	for target in targets:
		if target is Hurtbox:
			target.receive_damage(damage_instance)
	cooldown_timer.start(cooldown)
