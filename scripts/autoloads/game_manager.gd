extends Node


signal on_customer_request(customer: Customer)

const ITEM_BURGER = preload("res://data/item_burger.tres")
const ITEM_COFFEE = preload("res://data/item_coffee.tres")

var coffee_item_counter_pos:= Vector2(950,800)
var burger_item_counter_pos:= Vector2(1100,800)


func get_random_item() -> Item:
	var items: Array = [ITEM_BURGER, ITEM_COFFEE]
	return items.pick_random()


func get_item_counter_pos(item: Item) -> Vector2:
	match item.type:
		Item.ItemType.Coffee:
			return coffee_item_counter_pos
		Item.ItemType.Burger:
			return burger_item_counter_pos
		
	return Vector2.ZERO
