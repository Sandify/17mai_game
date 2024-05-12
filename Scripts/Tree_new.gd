extends Area2D

var showInteractionLabel = false
signal tree_cut_down

@onready var tree = $Tree
@onready var audio_player = $AudioStreamPlayer2D
@onready var timer = $TreeGrow

func _ready():
	pass

func _process(delta):
	$Label.visible = showInteractionLabel

	if showInteractionLabel and Input.is_action_just_pressed("interact"):
		queue_free()
		emit_signal("tree_cut_down")
		

func _on_body_entered(body):
	if body is Player: showInteractionLabel = true

func _on_body_exited(body):
	if body is Player: showInteractionLabel = false

func _on_audio_stream_player_2d_finished():
	tree.hide()


func _on_treegrow_timeout():
	tree.show()
