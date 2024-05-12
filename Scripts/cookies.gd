extends Area2D

var showInteractionLabel = false
signal cookies_picked_up

@onready var cookie = $cookies

func _ready():
	pass

func _process(delta):
	$Label.visible = showInteractionLabel

	if showInteractionLabel and Input.is_action_just_pressed("interact"):
		queue_free()
		emit_signal("cookies_picked_up")
		

func _on_body_entered(body):
	if body is Player: showInteractionLabel = true

func _on_body_exited(body):
	if body is Player: showInteractionLabel = false

