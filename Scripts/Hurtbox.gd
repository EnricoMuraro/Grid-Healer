class_name Hurtbox
extends Area2D

signal damage_received(amount)

func receive_damage(amount):
	damage_received.emit(amount)
