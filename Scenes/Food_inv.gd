extends Label

var food = 10
@onready var food_timer = $"../Food_timer"
signal out_of_food

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = "Food: " + str(food)
	
	if food < 1:
		print("out of food")
		emit_signal("out_of_food")
		food_timer.stop()

func _on_tree_tree_cut_down():
	var random_generator = RandomNumberGenerator.new()
	var random_number = random_generator.randi_range(1, 2)
	
	
	if random_number == 1:
		food += 2


func _on_food_timer_timeout():
	food -= 1
