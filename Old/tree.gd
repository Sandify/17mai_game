extends Area2D

var showInteractionLabel = false

@onready var tree = $Tree
@onready var audio_player = $AudioStreamPlayer2D
@onready var timer = $TreeGrow

func _ready():
	pass

func _process(delta):
	pass
	#$Label.visible = showInteractionLabel

	#if showInteractionLabel and Input.is_action_just_pressed("interact"):
		#audio_player.play()
		#queue_free()
		#timer.start()
		

#func _on_body_entered(body):
	#if body is Player: showInteractionLabel = true
#
#func _on_body_exited(body):
	#if body is Player: showInteractionLabel = false

#func _on_audio_stream_player_2d_finished():
	#tree.hide()


#func _on_tree_grow_timeout():
	#tree.show()
