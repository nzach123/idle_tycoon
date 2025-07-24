extends Resource
class_name Item

signal on_star_reached

enum ItemType{
	Coffee,
	Burger
}

@export var id: String
@export var type: ItemType
@export var sprite: Texture2D


@export_group("Cook")
@export var cook_time: float = 10.0
@export var cook_time_reduce_perc:float = 0.50

@export_group("Upgrade")
@export var upgrade_cost: float = 3.0
@export var upgrade_multi: float = 1.3

@export_group("Profit")
@export var profit: float = 4.0
@export var profit_multi: float = 1.2

@export_category("Levels")
@export var max_level: int = 75

var current_level: int = 0

func update_item() -> void:
	if current_level >= max_level:
		return
	
	current_level += 1
	upgrade_cost = ceil(upgrade_cost * upgrade_multi)
	profit = ceil(profit * profit_multi)
	if current_level % 25 == 0:
		cook_time = ceil(cook_time * cook_time_reduce_perc)
		upgrade_cost = upgrade_cost * 3
		profit = profit * 3
		on_star_reached.emit()
		
