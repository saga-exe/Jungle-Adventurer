extends Control

var previous_level = 0

onready var layer1 = $Node/ParallaxBackground/ParallaxLayer1
onready var layer2 = $Node/ParallaxBackground/ParallaxLayer2
onready var layer3 = $Node/ParallaxBackground/ParallaxLayer3
onready var layer4 = $Node/ParallaxBackground/ParallaxLayer4
onready var layer5 = $Node/ParallaxBackground2/ParallaxLayer5
onready var layer6 = $Node/ParallaxBackground2/ParallaxLayer6
onready var firework_scene = preload("res://Scenes/Fireworks.tscn")


func _ready() -> void:
	$Music.play()
	$SoundPlayer.play("MusicFadeIn")
	if Globals.score > Globals.highscore:
		Globals.highscore = Globals.score
	if Globals.level == 2:
		$VBoxContainer/NextLevelButton.disabled = true
		$VBoxContainer/NextLevelButton.visible = false
		$LevelFinishedText.text = "Game Completed"
	if Globals.level != 0:
		$VBoxContainer2/Highscore.text = "Highscore: " + str(Globals.highscore)
		$VBoxContainer2/Score.text = "Score: " + str(Globals.score)
		$LevelFinishedText.rect_position.y = 170
	else:
		$LevelFinishedText.rect_position.y = 200
	Globals.is_finished = false
	previous_level = Globals.level


func _physics_process(delta: float) -> void: #_physics_process() får bakgrunden att röra sig genom att röra på de olika lagren olika snabbt.
	layer1.motion_offset.x += 40*delta
	layer2.motion_offset.x += 30*delta
	layer3.motion_offset.x += 20*delta
	layer4.motion_offset.x += 10*delta
	layer5.motion_offset.x += 5*delta
	layer6.motion_offset.x += 5*delta


"""
Då en timer för fyrverkerierna tar slut så instansieras en ny fyrverkeri-scen på
en randomiserad positition.
"""
func _on_FireworkTimer_timeout() -> void:
	var firework_instance = firework_scene.instance()
	get_tree().get_root().add_child(firework_instance)
	firework_instance.global_position = Vector2(rand_range(0, 1024), rand_range(0, 600))


"""
Då knappen för startmenyn trycks så stoppas alla fyverkeritimers och musiken
fadear ut. Sedan laddas startmenyn genom transition-scenen.
"""
func _on_MainMenuButton_pressed() -> void:
	$FireworkTimer.stop()
	$FireworkTimer2.stop()
	$FireworkTimer3.stop()
	$SoundPlayer.play_backwards("MusicFadeIn")
	Transition.load_scene("res://Scenes/MainMenu.tscn")


"""
Då knappen för nästa level trycks så stoppas alla fyverkeritimers och musiken
fadear ut. Sedan laddas nästa level genom transition-scenen.
"""
func _on_NextLevelButton_pressed():
	$FireworkTimer.stop()
	$FireworkTimer2.stop()
	$FireworkTimer3.stop()
	$SoundPlayer.play_backwards("MusicFadeIn")
	if previous_level < 2:
		Transition.level(previous_level + 1)
		Transition.load_scene("res://Scenes/MainScene.tscn")
	else:
		return
