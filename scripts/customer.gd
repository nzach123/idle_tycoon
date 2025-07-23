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
	
