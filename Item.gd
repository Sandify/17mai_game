@tool
extends Node2D

# FOOD
const ITEM_APPLE = preload("res://Textures/icons/Pixel Art Icon Pack - RPG/Food/Apple.png")

# MATERIAL
const ITEM_WOOD = preload("res://Textures/icons/Pixel Art Icon Pack - RPG/Material/Wood Log.png")
#const ITEM_ = preload()
#const ITEM_ = preload()
#const ITEM_ = preload()

# TOOL
const ITEM_PICKAXE = preload("res://Textures/icons/Pixel Art Icon Pack - RPG/Weapon & Tool/Pickaxe.png")
const ITEM_TORCH = preload("res://Textures/icons/Pixel Art Icon Pack - RPG/Weapon & Tool/Torch.png")
const ITEM_WOOD_SWORD = preload("res://Textures/icons/Pixel Art Icon Pack - RPG/Weapon & Tool/Wooden Sword.png")


const ITEM_TEXTURES = [
	ITEM_APPLE,ITEM_WOOD,ITEM_PICKAXE,ITEM_TORCH,ITEM_WOOD_SWORD
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
