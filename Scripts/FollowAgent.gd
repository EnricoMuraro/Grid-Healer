extends NavigationAgent2D

var agent: RID = get_rid()
# Enable avoidance
NavigationServer2D.agent_set_avoidance_enabled(agent, true)
# Create avoidance callback
NavigationServer2D.agent_set_avoidance_callback(agent, Callable(self, "_avoidance_done"))

# Disable avoidance
NavigationServer2D.agent_set_avoidance_enabled(agent, false)
# Delete avoidance callback
NavigationServer2D.agent_set_avoidance_callback(agent, Callable())

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
