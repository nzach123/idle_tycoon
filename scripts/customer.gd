extends Node2D
class_name Customer

@onready var body: Sprite2D = %Body
@onready var face: Sprite2D = %Face
@onready var hand_left: Sprite2D = %HandLeft
@onready var hand_right: Sprite2D = %HandRight
@onready var anim_player: AnimationPlayer = $AnimationPlayer

@onready var item_box: Control = $ItemBox
@onready var item_image: TextureRect = %ItemImage
@onready var item_label: Label = %ItemLabel


var request_item: Item
var request_quantity: int
var current_order_status: int

var counter_pos: Vector2
var waiting_order: bool = false
var being_served: bool = false

func _process(delta: float) -> void:
	item_label.text = str(current_order_status)

func init_customer(item: Item, quanity: int) -> void:
	request_item = item
	request_quantity = quanity
	current_order_status = quanity
	


func move_to_counter() -> void:
	play_move_anim()
	var tween: Tween = create_tween()
	tween.tween_property(self, "position", Vector2(counter_pos.x, position.y), 3.0)
	tween.tween_interval(0.2)
	tween.tween_property(self, "position", counter_pos, 1.0)
	tween.tween_interval(0.5)
	tween.finished.connect(func():
		anim_player.play("idle")
		waiting_order = true
		GameManager.on_customer_request.emit(self)
	)

func recieve_order() -> void:
	current_order_status -= 1
	if current_order_status <= 0:
		order_completed()
		
func order_completed() -> void:
	item_box.hide()
	waiting_order = false
	var counter_top_pos: float = counter_pos.y - 100
	
	var tween := create_tween()
	var final_pos := Vector2(counter_pos.x, counter_top_pos)
	tween.tween_property(self, "position", final_pos, 1.0)
	tween.tween_interval(0.2)
	var end_postion  := Vector2(counter_pos.x + 1500, counter_top_pos)
	tween.tween_property(self, "position", end_postion, 3.0 )
	tween.tween_interval(0.2)
	tween.finished.connect(func(): GameManager.on_customer_order_competed.emit(self))
		
	
func set_sprites(data: CustomerData)-> void:
	body.texture = data.body
	face.texture = data.face
	hand_left.texture = data.hand
	hand_right.texture = data.hand
	
func play_move_anim() -> void:
	anim_player.play("move")

func show_order_ui() -> void:
	item_box.show()
	item_image.texture = request_item.sprite
	item_label.text = str(request_quantity)
	
