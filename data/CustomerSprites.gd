extends Node


@export var bodies: Dictionary = {
	"blue": {
		"circle": preload("res://assets/Sprites/Characters/blue_body_circle.png"),
		"rhombus": preload("res://assets/Sprites/Characters/blue_body_rhombus.png"),
		"square": preload("res://assets/Sprites/Characters/blue_body_square.png"),
		"squircle": preload("res://assets/Sprites/Characters/blue_body_squircle.png")
	},
	"green": {
		"circle": preload("res://assets/Sprites/Characters/green_body_circle.png"),
		"rhombus": preload("res://assets/Sprites/Characters/green_body_rhombus.png"),
		"square": preload("res://assets/Sprites/Characters/green_body_square.png"),
		"squircle": preload("res://assets/Sprites/Characters/green_body_squircle.png")
	},
	"pink": {
		"circle": preload("res://assets/Sprites/Characters/pink_body_circle.png"),
		"rhombus": preload("res://assets/Sprites/Characters/pink_body_rhombus.png"),
		"square": preload("res://assets/Sprites/Characters/pink_body_square.png"),
		"squircle": preload("res://assets/Sprites/Characters/pink_body_squircle.png")
	},
	"purple": {
		"circle": preload("res://assets/Sprites/Characters/purple_body_circle.png"),
		"rhombus": preload("res://assets/Sprites/Characters/purple_body_rhombus.png"),
		"square": preload("res://assets/Sprites/Characters/purple_body_square.png"),
		"squircle": preload("res://assets/Sprites/Characters/purple_body_squircle.png")
	},
	"red": {
		"circle": preload("res://assets/Sprites/Characters/red_body_circle.png"),
		"rhombus": preload("res://assets/Sprites/Characters/red_body_rhombus.png"),
		"square": preload("res://assets/Sprites/Characters/red_body_square.png"),
		"squircle": preload("res://assets/Sprites/Characters/red_body_squircle.png")
	},
	"yellow": {
		"circle": preload("res://assets/Sprites/Characters/yellow_body_circle.png"),
		"rhombus": preload("res://assets/Sprites/Characters/yellow_body_rhombus.png"),
		"square": preload("res://assets/Sprites/Characters/yellow_body_square.png"),
		"squircle": preload("res://assets/Sprites/Characters/yellow_body_squircle.png")
	}
}

@export var hands: Dictionary = {
	"blue": {
		"closed": preload("res://assets/Sprites/Characters/blue_hand_closed.png"),
		"open": preload("res://assets/Sprites/Characters/blue_hand_open.png"),
		"peace": preload("res://assets/Sprites/Characters/blue_hand_peace.png"),
		"point": preload("res://assets/Sprites/Characters/blue_hand_point.png"),
		"rock": preload("res://assets/Sprites/Characters/blue_hand_rock.png"),
		"thumb": preload("res://assets/Sprites/Characters/blue_hand_thumb.png")
	},
	"green": {
		"closed": preload("res://assets/Sprites/Characters/green_hand_closed.png"),
		"open": preload("res://assets/Sprites/Characters/green_hand_open.png"),
		"peace": preload("res://assets/Sprites/Characters/green_hand_peace.png"),
		"point": preload("res://assets/Sprites/Characters/green_hand_point.png"),
		"rock": preload("res://assets/Sprites/Characters/green_hand_rock.png"),
		"thumb": preload("res://assets/Sprites/Characters/green_hand_thumb.png")
	},
	"pink": {
		"closed": preload("res://assets/Sprites/Characters/pink_hand_closed.png"),
		"open": preload("res://assets/Sprites/Characters/pink_hand_open.png"),
		"peace": preload("res://assets/Sprites/Characters/pink_hand_peace.png"),
		"point": preload("res://assets/Sprites/Characters/pink_hand_point.png"),
		"rock": preload("res://assets/Sprites/Characters/pink_hand_rock.png"),
		"thumb": preload("res://assets/Sprites/Characters/pink_hand_thumb.png")
	},
	"purple": {
		"closed": preload("res://assets/Sprites/Characters/purple_hand_closed.png"),
		"open": preload("res://assets/Sprites/Characters/purple_hand_open.png"),
		"peace": preload("res://assets/Sprites/Characters/purple_hand_peace.png"),
		"point": preload("res://assets/Sprites/Characters/purple_hand_point.png"),
		"rock": preload("res://assets/Sprites/Characters/purple_hand_rock.png"),
		"thumb": preload("res://assets/Sprites/Characters/purple_hand_thumb.png")
	},
	"red": {
		"closed": preload("res://assets/Sprites/Characters/red_hand_closed.png"),
		"open": preload("res://assets/Sprites/Characters/red_hand_open.png"),
		"peace": preload("res://assets/Sprites/Characters/red_hand_peace.png"),
		"point": preload("res://assets/Sprites/Characters/red_hand_point.png"),
		"rock": preload("res://assets/Sprites/Characters/red_hand_rock.png"),
		"thumb": preload("res://assets/Sprites/Characters/red_hand_thumb.png")
	},
	"yellow": {
		"closed": preload("res://assets/Sprites/Characters/hand_yellow_closed.png"),
		"open": preload("res://assets/Sprites/Characters/hand_yellow_open.png"),
		"peace": preload("res://assets/Sprites/Characters/hand_yellow_peace.png"),
		"point": preload("res://assets/Sprites/Characters/hand_yellow_point.png"),
		"rock": preload("res://assets/Sprites/Characters/hand_yellow_rock.png"),
		"thumb": preload("res://assets/Sprites/Characters/hand_yellow_thumb.png")
	}
}

@export var faces: Array = [
	preload("res://assets/Sprites/Characters/face_a.png"),
	preload("res://assets/Sprites/Characters/face_b.png"),
	preload("res://assets/Sprites/Characters/face_c.png"),
	preload("res://assets/Sprites/Characters/face_d.png"),
	preload("res://assets/Sprites/Characters/face_e.png"),
	preload("res://assets/Sprites/Characters/face_f.png"),
	preload("res://assets/Sprites/Characters/face_g.png"),
	preload("res://assets/Sprites/Characters/face_h.png"),
	preload("res://assets/Sprites/Characters/face_i.png"),
	preload("res://assets/Sprites/Characters/face_j.png"),
	preload("res://assets/Sprites/Characters/face_k.png"),
	preload("res://assets/Sprites/Characters/face_l.png")
]

# Function to get a random customer appearance
func get_random_customer() -> Dictionary:
	var colors = bodies.keys()
	var random_color = colors[randi() % colors.size()]

	var body_shapes = bodies[random_color].keys()
	var random_body_shape = body_shapes[randi() % body_shapes.size()]

	var hand_types = hands[random_color].keys()
	var random_hand_type = hand_types[randi() % hand_types.size()]

	var random_face = faces[randi() % faces.size()]

	return {
		"body": bodies[random_color][random_body_shape],
		"hand": hands[random_color][random_hand_type],
		"face": random_face,
		"color": random_color
	}
