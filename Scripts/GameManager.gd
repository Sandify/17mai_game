extends Node2D

#enum State{
	#Play,
	#Building,
	#Destroying
#}
#
#var CurrentState = State.Play
#
var Wood = 0
var Stone := 0
var Food := 10
var Health := 100


#var Population : int = 0
#var MaxPopulation : int = 4
#var AlvPopulation : int = 0
#var Citizen : PackedScene
#var Happiness := 1
#var spawnReady := true
#var firePitSpaces : Array
#var occupiedFirePitSpaces : Array
var foodBool = true
#var TaxRate := 2
#
#func _ready():
	#Citizen = ResourceLoader.load("res://Assets/Citizen.tscn")
	#firePitSpaces = get_tree().get_nodes_in_group("CitizenSpawnPoint")
#
func _process(delta):
	pass
	#if Population < MaxPopulation and spawnReady and Happiness > 0 and firePitSpaces.size() > 0:
		#spawnReady = false
		#await get_tree().create_timer(3.0).timeout
		#spawnReady = true
		#var citizen = Citizen.instantiate()
		#firePitSpaces[0].add_child(citizen)
		#citizen.FirePitPos = firePitSpaces[0]
		#citizen.SpawnObjectSetup()
		#occupiedFirePitSpaces.append(firePitSpaces.pop_front())
		#Population += 1
		#AlvPopulation += 1
	#elif spawnReady and Happiness < 0:
		#spawnReady = false
		#await get_tree().create_timer(3.0).timeout
		#spawnReady = true
		#if AlvPopulation > 0:
			#RemoveCitizen(1)
	#if foodBool:
		#foodBool = false
		#await get_tree().create_timer(10.0).timeout
		#Food -= 1
		#if Food < 0:
			#Food = 0
		#foodBool = true
		##Gold += round(Population * TaxRate)
		##var happinessValue = 1
		#if Food > 0:
			#if Health < 100:
				#Health += 1
		#else:
			#Health -= 5
#
		#if TaxRate > 0:
			#happinessValue -= round(TaxRate / 2)
		#if TaxRate < 0:
			#happinessValue -= round(TaxRate / 2)
#
		#Happiness += happinessValue
		#if Happiness >= 2:
			#Happiness = 2
		#elif Happiness <= -2:
			#Happiness = -2
#
#func RemoveCitizen(Cost : int):
	#for i in range(0, Cost, 1):
		#firePitSpaces.append(occupiedFirePitSpaces[0])
		#var temp : Node3D = occupiedFirePitSpaces[0]
		#delete_children(temp)
		#occupiedFirePitSpaces.erase(0)
		#AlvPopulation -= 1
		#Population -= 1
		#Health -= 5
#
#func delete_children(node):
	#for n in node.get_children():
		#node.remove_child(n)
		#n.queue_free()


func _on_tree_tree_cut_down():
	var random_generator = RandomNumberGenerator.new()
	var random_number = random_generator.randi_range(3, 12)
	Wood += 5
