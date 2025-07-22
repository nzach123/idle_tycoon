extends Node2D
class_name Cashier

@export var move_speed := 50.0
@onready var anim_player: AnimationPlayer = $AnimationPlayer

func move_to_customer() -> void:
	#Create Tween
	#Move
	anim_player.play("move")
	
func move_to_item_position() -> void:
	#Create Tween
	#Move to item counter pos
	#start cook time
	anim_player.play("idle")
	
	
