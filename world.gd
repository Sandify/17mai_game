extends Node2D

@onready var inventory_popup = $inventory
var popup_open = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#if Input.is_action_just_pressed("inventory"):
		#inventory_popup.show()

func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_TAB:
			if not popup_open:
				inventory_popup.show()
				popup_open = true
			else:
				inventory_popup.hide()
				popup_open = false
	return true
