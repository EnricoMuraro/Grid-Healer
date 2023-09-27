class_name Player
extends CharacterBody2D

var movement_speed: float = 64
var moving = false
var tile_size = 16
var inputs = {
	"right": Vector2.RIGHT,
	"left": Vector2.LEFT,
	"up": Vector2.UP,
	"down": Vector2.DOWN
}
var last_inputs = []
var target: Vector2

@onready var ray := $RayCast2D
@onready var ability_bar := $AbilityBar

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size / 2
	
func _physics_process(_delta):
	if Input.is_action_just_pressed("ability1"):
		ability_bar.activate_ability(0)
	for dir in inputs.keys():
		if Input.is_action_just_pressed(dir) && dir not in last_inputs:
			last_inputs.append(dir)
		if Input.is_action_just_released(dir):
			last_inputs.erase(dir)
#
	if not last_inputs.is_empty():
		if not moving:
			ray.target_position = inputs[last_inputs[-1]] * tile_size
			ray.force_raycast_update()
			if !ray.is_colliding():
				target = to_global(ray.target_position)
				moving = true
		
	if moving:
		velocity = position.direction_to(target) * movement_speed
		if position.distance_to(target) > 0.1:
			move_and_slide()
		else:
			moving = false

	
#func move(dir):
#	if not moving:
#		ray.target_position = inputs[dir] * tile_size
#		ray.force_raycast_update()
#		if !ray.is_colliding():
#			#position += inputs[dir] * tile_size
#			var tween = get_tree().create_tween()
#			tween.tween_property(self, "position", position + inputs[dir] * tile_size, 1.0/animation_speed).set_trans(Tween.TRANS_SINE)
#			moving = true
#			# $AnimationPlayer.play(dir)
#			await tween.finished
#			var current_agent_position: Vector2 = global_position
# 			var next_path_position: Vector2 = navigation_agent.get_next_path_position()
#
#			var new_velocity: Vector2 = next_path_position - current_agent_position
#			new_velocity = new_velocity.normalized()
#			new_velocity = new_velocity * movement_speed
#
#			velocity = new_velocity
#			move_and_slide()
#			moving = false
