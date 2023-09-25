class_name Healbox
extends Area2D

signal heal_received(amount)

func receive_heal(amount):
	heal_received.emit(amount)
