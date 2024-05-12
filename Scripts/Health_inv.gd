extends Label

var health = 100
var food = FoodInv.food
@onready var health_timer = $"../Health_timer"



# Called when the node enters the scene tree for the first time.
#func _ready():
	#health_timer = Timer.new()
	#health_timer.wait_time = 2
	#add_child(health_timer)
	#health_timer.autostart = false
	#health_timer.start()
	#health_timer.stop()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = "Health: " + str(health)

	# Start or stop health_timer based on food variable
	#if food > 0:
		#health_timer.stop()
	#else:
		#health_timer.start()
#
	## Decrement health variable if health_timer is not stopped
	#if health_timer.is_stopped() == false:
		#health -= 5


func _on_food_out_of_food():
	health_timer.start()


#func _on_food_player_has_food():
	#health_timer.stop()

#func gefgeg():
	#out_of_food.emitting = true
	#health = -1
#
#func asffg():
	#if player_has_food <= 0:
		#health = - 1

#func no_food():
	#if food <= 0:
		#$CanvasLayer/Health_timer.start()
	#else:
		#$CanvasLayer/Health_timer.stop()

