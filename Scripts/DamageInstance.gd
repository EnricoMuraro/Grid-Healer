class_name DamageInstance

enum Type {PHYSICAL, MAGIC, TRUE}

var amount: int
var type: DamageInstance.Type

func _init(a, t):
	self.amount = a
	self.type = t
