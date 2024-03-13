extends CharacterBody2D

const GRAVITY : float = 700.0
@onready var sprite : AnimatedSprite2D = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
	
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	
	move_and_slide()
# check if the sprite is touching the barrier(floor); if so, we come to a die state	
	if is_on_floor() == true:
		die()
		
# the function stop the animation and the physic process
func die() -> void:
	sprite.stop()
	set_physics_process(false)
