extends Label

var wood = 5

func _ready():
	pass # Replace with function body.



func _process(delta):
	self.text = "Wood: " + str(wood)


func _on_tree_tree_cut_down():
	var random_generator = RandomNumberGenerator.new()
	var random_number = random_generator.randi_range(3, 12)
	wood += random_number
