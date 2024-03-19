extends Control
@onready var hs_score = $MC/HsScore


# Called when the node enters the scene tree for the first time.
func _ready():
	hs_score.text = str(ScoreManager.get_high_score())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("fly") == true:
		GameManager.load_game_scene()
