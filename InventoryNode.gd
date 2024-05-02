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

func get_index_by_pos(lpos: Vector2) -> int:
	if lpos.x<0 or lpos.y<0:
		return -1
	if lpos.x>=(SLOTS_X*(SLOT_SIZE.x+SPACING.x)):
		return -1
	if lpos.y>=(SLOTS_Y*(SLOT_SIZE.y+SPACING.y)):
		return -1
	var rough_slot = lpos/(SLOT_SIZE+SPACING)
	var int_x = int(rough_slot.x)
	var int_y = int(rough_slot.y)
	var index = int_y*SLOTS_X+int_x
	return index

var items : Array


# Called when the node enters the scene tree for the first time.
func _ready():
	items = []
	for i in range(MAX_SLOTS):
		items.append(null)
	var i = 0
	for child in get_children():
		items[i] = child
		1==1
	update_item_positions()

func update_item_positions():
	for i in range(MAX_SLOTS):
		var item = items[i]
		if item != null:
			item.position = get_pos_by_index(i)+HALF_SLOT


var hovered_index = -1
var picked_item = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var l_mpos = get_local_mouse_position()
	hovered_index = get_index_by_pos(l_mpos)
	queue_redraw()

func _draw():
	for i in range(MAX_SLOTS):
		var rect = Rect2(get_pos_by_index(i), SLOT_SIZE)
		var col = Color.DIM_GRAY
		if i == hovered_index:
			col = Color.GRAY
		draw_rect(rect, col)
