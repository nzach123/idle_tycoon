extends Node
class_name CustomerManager



@export var spawn_positions: Array[Marker2D]
@export var customer_scene: PackedScene

@onready var counter_manager: CounterManager = %CounterManager


func _ready() -> void:
	spawn_customer()

func spawn_customer() -> void: 
	var customer: Customer = customer_scene.instantiate()
	add_child(customer)
	
	#Get random sprites
	customer.randomize_appearance()
	
	#Get random item and quantity
	var random_quantity: int = randi_range(1,3)
	var random_item: Item = GameManager.get_random_item()
	customer.init_customer(random_item, random_quantity)
	
	if counter_manager.get_free_index() != -1:
		customer.position = spawn_positions[1].position
		counter_manager.assign_customer(customer)
		customer.move_to_counter()
	else:
		#Get random spawn pos
		var random_start_pos: Marker2D = spawn_positions.pick_random()
		customer.position = random_start_pos.position
		customer.play_move_anim()
		
		var tween: Tween = create_tween()
		tween.tween_property(customer, "position", customer.position + Vector2.RIGHT * 2080, 5.0)
		tween.finished.connect(func(): customer.queue_free())


func _on_spawn_timer_timeout() -> void:
	spawn_customer()
