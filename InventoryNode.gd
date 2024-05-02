extends Node2D

const SLOTS_X = 3
const SLOTS_Y = 4

const SLOT_SIZE = Vector2(64,64)
const HALF_SLOT = 0.5*SLOT_SIZE
const SPACING = Vector2(2,2)

const MAX_SLOTS = SLOTS_X * SLOTS_Y

func get_pos_by_index(idx: int) -> Vector2:
	#print("get_pos_by_index(", idx, ")")
	var slots_x = idx%3
	var slots_y = int(idx/3)
	var pos = (SLOT_SIZE+SPACING)*Vector2(slots_x,slots_y)
	#print("  returning ", pos)
	return pos

func get_index_by_pos(lpos: Vector2) -> int:
	#print("get_index_by_pos(", l_mpos, ")")
	if lpos.x<0 or lpos.y<0:
		#print("  returning -1 (out of bounds)")
		return -1
	if lpos.x>=(SLOTS_X*(SLOT_SIZE.x+SPACING.x)):
		#print("  returning -1 (out of bounds)")
		return -1
	if lpos.y>=(SLOTS_Y*(SLOT_SIZE.y+SPACING.y)):
		#print("  returning -1 (out of bounds)")
		return -1
	var rough_slot = lpos/(SLOT_SIZE+SPACING)
	var int_x = int(rough_slot.x)
	var int_y = int(rough_slot.y)
	var index = int_y*SLOTS_X+int_x
	#print("  returning ", index)
	return index

var items : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	#print("_ready()")
	items = []
	for i in range(MAX_SLOTS):
		items.append(null)
		#print("  items[", i, "] = null")
	var i = 0
	for child in get_children():
		items[i] = child
		#print("  items[", i, "] = ", child)
		i += 1
	update_item_positions()

func update_item_positions():
	#print("update_item_positions()")
	for i in range(MAX_SLOTS):
		var item = items[i]
		if item!= null:
			var pos = get_pos_by_index(i)+HALF_SLOT
			#print("  setting item[", i, "] position to ", pos)
			item.position = pos

var hovered_index = -1
var picked_item = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print("_process(", delta, ")")
	var l_mpos = get_local_mouse_position()
	#print("  local mouse position: ", l_mpos)
	hovered_index = get_index_by_pos(l_mpos)
	#print("  hovered_index: ", hovered_index)
	if Input.is_action_just_pressed("left_click"):
		var itm = get_item(hovered_index)
		if itm != null and picked_item == null:
			picked_item = itm
	
	if picked_item != null:
		picked_item.position = get_local_mouse_position()
	
	if Input.is_action_just_released("left_click"):
		if hovered_index >= 0 and hovered_index < MAX_SLOTS and items[hovered_index] == null:
			items[hovered_index] = picked_item
		picked_item = null
		update_item_positions()
	queue_redraw()

func get_item(idx:int) -> Item:
	if idx<0 or idx>=MAX_SLOTS:
		return null
	var itm = items[idx]
	items[idx] = null
	return itm

func _draw():
	#print("_draw()")
	for i in range(MAX_SLOTS):
		var rect = Rect2(get_pos_by_index(i), SLOT_SIZE)
		var col = Color.DIM_GRAY
		if i == hovered_index:
			col = Color.GRAY
		#print("  drawing rect[", i, "] at ", rect, " with color ", col)
		draw_rect(rect, col)
