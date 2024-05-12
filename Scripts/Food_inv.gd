extends Label

# Timer
#var food_timer = Timer.new()
@export var food_timer_duration: int = 1
@onready var food_timer = $"../Food_timer"

@export var food = 10
signal out_of_food
signal player_has_food

# Called when the node enters the scene tree for the first time.
#func _ready():
	#food_timer = Timer.new()
	#food_timer.wait_time = food_timer_duration
	#add_child(food_timer)
	#food_timer.autostart = true
	#food_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = "Food: " + str(food)


	#if food <= 0:
		#print("out of food")
		#emit_signal("out_of_food")
		#HealthInv.health -= 10 # Decrease health by 10 when out of food
		#food_timer.stop()
	#else:
		#food_timer.start()
		#print("food")
		#emit_signal("player_has_food")
#
	## Call food_remover() function every frame
	#food_remover()

func _on_tree_tree_cut_down():
	var random_generator = RandomNumberGenerator.new()
	var random_number = random_generator.randi_range(1, 2)
	
	
	if random_number == 1:
		food += 2

func _on_cookie_cookies_picked_up():
	food += 500

func food_remover():
	pass

func _on_food_timer_timeout():
	food -= 1


#func gefgeg():
	#out_of_food.emitting = true
	#health = -1
#
#func asffg():
	#if player_has_food <= 0:
		#health = - 1
