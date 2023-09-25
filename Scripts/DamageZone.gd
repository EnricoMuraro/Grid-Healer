extends Node2D

@export var damage := 5
@export var cooldown := 1

@onready var hitbox := $Hitbox
@onready var cooldown_timer := $Timer

func _ready():
	cooldown_timer.timeout.connect(apply_damage)

func apply_damage():
	var targets = hitbox.get_overlapping_areas()
	for target in targets:
		if target is Hurtbox:
			target.receive_damage(damage)
	cooldown_timer.start(cooldown)
