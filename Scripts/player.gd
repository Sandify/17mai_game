extends CharacterBody2D
class_name Player

const SPEED = 150.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var Yaxis = Input.get_axis("move_up", "move_down")
	if Yaxis:
		velocity.y = Yaxis * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	var Xaxis = Input.get_axis("move_left", "move_right")
	if Xaxis:
		velocity.x = Xaxis * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
