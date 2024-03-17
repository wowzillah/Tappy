extends Node2D

@onready var pipes_holder = $PipesHolder
@export var pipes_scene : PackedScene
@onready var spawn_u = $SpawnU
@onready var spawn_l = $SpawnL
@onready var spawn_timer = $SpawnTimer



# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_plane_died.connect(_on_plane_died)
	randomize()
	spawn_pipes()
	ScoreManager.set_score(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_pipes() -> void:
	var new_pipes = pipes_scene.instantiate()
	var y_pos= randf_range(spawn_u.position.y,spawn_l.position.y)
	new_pipes.position = Vector2(spawn_u.position.x ,y_pos)
	pipes_holder.add_child(new_pipes)

func stop_pipes() -> void :
	spawn_timer.stop()
	for pipe in pipes_holder.get_children():
		pipe.set_process(false)
	
func _on_spawn_timer_timeout():
	spawn_pipes()


func _on_plane_died():
	stop_pipes()
