extends CharacterBody2D

#signal  on_plane_died

const GRAVITY : float = 1500
const POWER : float = -500.0
@onready var sprite : AnimatedSprite2D = $Sprite
@onready var animation_player : AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
	
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	
	fly()
	
	move_and_slide()
# check if the sprite is touching the barrier(floor); if so, we come to a die state	
	if is_on_floor() == true:
		die()


#the function listen to the input(space bar in order to make the plane fly
func fly() -> void:
	if Input.is_action_just_pressed("fly") == true:
		velocity.y = POWER		
		animation_player.play("power")
		
# the function stop the animation and the physic process
func die() -> void:
	sprite.stop()
	set_physics_process(false)
	#on_plane_died.emit()
	SignalManager.on_plane_died.emit()
