extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Control/VBoxContainer/Wood/WoodValue.text = str(GameManager.Wood)
	$Control/VBoxContainer/Stone/StoneValue.text = str(GameManager.Stone)
	$Control/Health/HealthValue.text = str(GameManager.Health)
	$Control/VBoxContainer/Food/FoodValue.text = str(GameManager.Food)
	pass


func _on_IncreaseTaxes_button_down():
	GameManager.TaxRate += 2
	pass # Replace with function body.


func _on_DecreaseTaxes_button_down():
	GameManager.TaxRate -= 2 
	pass # Replace with function body.
