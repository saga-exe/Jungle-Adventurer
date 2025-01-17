extends Control

#alla lager i parallaxbakgrunden
onready var layer1 = $Node/ParallaxBackground/ParallaxLayer1
onready var layer2 = $Node/ParallaxBackground/ParallaxLayer2
onready var layer3 = $Node/ParallaxBackground/ParallaxLayer3
onready var layer4 = $Node/ParallaxBackground/ParallaxLayer4
onready var layer5 = $Node/ParallaxBackground2/ParallaxLayer5
onready var layer6 = $Node/ParallaxBackground2/ParallaxLayer6

func _ready() -> void:
	Globals.is_finished = false #återställer det globala värdet så att spelet kan spelas igen
	$Trombone.play() #spelar ljudet för game over

func _physics_process(delta: float) -> void:
	$Light2D.global_position = get_global_mouse_position() #lyser upp musen
	
	#gör så att bakgrunden rör på sig
	layer1.motion_offset.x += 5*delta
	layer2.motion_offset.x += 10*delta
	layer3.motion_offset.x += 15*delta
	layer4.motion_offset.x += 20*delta
	layer5.motion_offset.x += 25*delta
	layer6.motion_offset.x += 30*delta


func _on_MainMenuButton_pressed() -> void: #om den knapp är tryckt så kommer spelaren tillbaka till startmenyn
	Transition.load_scene("res://Scenes/MainMenu.tscn")


func _on_RestartButton_pressed() -> void: #om den knapp är tryckt så kommer startar leveln om
	Transition.load_scene("res://Scenes/MainScene.tscn")
