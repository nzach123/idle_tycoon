extends Node2D
class_name Cashier

@export var move_speed := 50.0
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var cook_bar: CookBar = $CookBar

var current_customer: Customer

var counter_pos: Vector2

var item_request: Item
var item_counter_pos: Vector2

func set_customer(customer: Customer) -> void:
	current_customer = customer
	customer.being_served = true
	counter_pos = Vector2(customer.position.x, customer.position.y + 160)
	item_request = customer.request_item
	item_counter_pos = GameManager.get_item_counter_pos(item_request)
	
	
func take_order() -> void:
	move_to_customer()
	await get_tree().create_timer(1.1).timeout
	current_customer.show_order_ui()
	move_to_item_position()

func move_to_customer() -> void:
	var tween := create_tween()
	tween.tween_property(self, "position", counter_pos, 1.0)
	anim_player.play("move")
	
func move_to_item_position() -> void:
	anim_player.play("idle")
	var tween := create_tween()
	tween.tween_property(self, "position", item_counter_pos, 1.0)
	tween.tween_interval(0.5)
	tween.finished.connect(func(): start_cook_time())
	
func start_cook_time() -> void:
	cook_bar.show()
	cook_bar.cook_item(item_request.cook_time)
	
func deliver_order() -> void:
	print("Cook Complete")
	


func _on_cook_bar_on_cook_completed() -> void:
	cook_bar.hide()
	cook_bar.reset_bar()
	deliver_order()
