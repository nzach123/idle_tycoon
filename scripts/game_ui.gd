extends CanvasLayer
class_name GameUI

@onready var coffee_panel: UpgradePanel = $CoffeePanel
@onready var burger_panel: UpgradePanel = $BurgerPanel
@onready var current_coins: Label = %CurrentCoins

func _ready() -> void:
	coffee_panel.init_upgrade_panel(GameManager.ITEM_COFFEE)
	burger_panel.init_upgrade_panel(GameManager.ITEM_BURGER)
	
func _process(delta: float) -> void:
	current_coins.text = str(GameManager.current_coins)

func _on_coffee_button_pressed() -> void:
	SoundManager.play_ui()
	if coffee_panel.visible == false:
		coffee_panel.visible = true
	else:
		coffee_panel.visible = false
	burger_panel.hide()


func _on_burger_button_pressed() -> void:
	SoundManager.play_ui()
	if burger_panel.visible == false:
		burger_panel.visible = true
	else:
		burger_panel.visible = false
		coffee_panel.hide()
