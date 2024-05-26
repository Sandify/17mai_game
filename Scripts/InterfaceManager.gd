extends Control

var foodBool = true

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# Connect the "test" signal to the "_on_test_signal" function
	GameManager.connect("test", _on_test_signal)
	#GameManager.connect("tree_cut_down", _tree_cut_down)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Control/VBoxContainer/Wood/WoodValue.text = str(GameManager.Wood)
	$Control/VBoxContainer/Stone/StoneValue.text = str(GameManager.Stone)
	$Control/Health/HealthValue.text = str(GameManager.Health)
	$Control/VBoxContainer/Food/FoodValue.text = str(GameManager.Food)
	
	if foodBool:
		foodBool = false
		await get_tree().create_timer(10.0).timeout
		GameManager.Food -= 1
		if GameManager.Food < 0:
			GameManager.Food = 0
		foodBool = true
		#Gold += round(Population * TaxRate)
		#var happinessValue = 1
		if GameManager.Food > 0:
			if GameManager.Health < 100:
				GameManager.Health += 5
		else:
			GameManager.Health -= 5

func _on_test_signal():
	print("test signal works")

func _on_IncreaseTaxes_button_down():
	GameManager.TaxRate += 2
	pass # Replace with function body.


func _on_DecreaseTaxes_button_down():
	GameManager.TaxRate -= 2 
	pass # Replace with function body.


func _on_cookie_cookies_picked_up():
	GameManager.Food += 250


func _on_tree_tree_cut_down():
	var random_generator = RandomNumberGenerator.new()
	var random_number = random_generator.randi_range(3, 12)
	GameManager.Wood += random_number
