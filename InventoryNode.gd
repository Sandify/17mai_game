extends Node2D

const SLOTS_X = 3
const SLOTS_Y = 4

const SLOT_SIZE = Vector2(64,64)
const HALF_SLOT = 0.5*SLOT_SIZE
const SPACING = Vector2(2,2)

const MAX_SLOTS = SLOTS_X * SLOTS_Y

func get_pos_by_index(idx: int) -> Vector2:
	var slots_x = idx%3
	var slots_y = int(idx/3)
	return (SLOT_SIZE+SPACING)*Vector2(slots_x,slots_y)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _draw():
	for i in range(MAX_SLOTS):
		var rect = Rect2(get_pos_by_index(i), SLOT_SIZE
