@tool
extends Node2D


const ITEM_WOOD = preload("res://Textures/wood_icon.webp")
const ITEM_FOOD = preload("res://Textures/food_icon.png")


const ITEM_TEXTURES = [
	ITEM_WOOD,ITEM_FOOD
]



func get_texture(idx: int) -> Texture:
	if idx<0:
		return null
	return ITEM_TEXTURES[min(idx, len(ITEM_TEXTURES)-1)]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

@export var item_id = 1
var current_id = -1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if current_id != item_id:
		current_id = item_id
		$Sprite2D.texture = get_texture(item_id)
