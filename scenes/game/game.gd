extends Node2D

@onready var pipes_holder = $PipesHolder
@export var pipes_scene : PackedScene
@onready var spawn_u = $SpawnU
@onready var spawn_l = $SpawnL



# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_pipes() -> void:
	var new_pipes = pipes_scene.instantiate()
	var y_pos= randf_range(spawn_u.position.y,spawn_l.position.y)
	new_pipes.position = Vector2(spawn_u.position.x ,y_pos)
	pipes_holder.add_child(new_pipes)
	
func _on_spawn_timer_timeout():
	spawn_pipes()
