class_name TickingStatusEffect
extends Node2D

@export var stats: StatusEffect
@export var tick_rate: Stat

func _ready():
	var tick_timer = Timer.new()
	tick_timer.start(tick_rate.get_value())
	tick_timer.timeout.connect(on_tick)
	add_child(tick_timer)
	
	get_tree().create_timer(stats.duration.get_value()).timeout.connect(queue_free)
	
	
func on_tick():
	pass
