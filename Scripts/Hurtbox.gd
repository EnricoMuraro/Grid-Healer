class_name Hurtbox
extends Area2D

signal damage_received(amount: DamageInstance)

func receive_damage(amount: DamageInstance):
	damage_received.emit(amount)
