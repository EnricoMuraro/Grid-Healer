extends Node2D

@onready var hitbox := $Hitbox
@onready var animation_player := $AnimationPlayer
var base_heal = 10

func _physics_process(_delta):
	var targets = hitbox.get_overlapping_areas()
	print(targets.size())
	for target in targets:
		if target is Healbox:
			target.receive_heal(base_heal)

	animation_player.play("healing_wave_cast")
	set_physics_process(false)
