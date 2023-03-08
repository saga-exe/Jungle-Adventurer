extends Control


onready var layer1 = $Node/ParallaxBackground/ParallaxLayer1
onready var layer2 = $Node/ParallaxBackground/ParallaxLayer2
onready var layer3 = $Node/ParallaxBackground/ParallaxLayer3
onready var layer4 = $Node/ParallaxBackground/ParallaxLayer4
onready var layer5 = $Node/ParallaxBackground2/ParallaxLayer5
onready var layer6 = $Node/ParallaxBackground2/ParallaxLayer6
onready var firework_scene = preload("res://Scenes/Fireworks.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	layer1.motion_offset.x += 40*delta
	layer2.motion_offset.x += 30*delta
	layer3.motion_offset.x += 20*delta
	layer4.motion_offset.x += 10*delta
	layer5.motion_offset.x += 5*delta
	layer6.motion_offset.x += 5*delta


func _on_FireworkTimer_timeout() -> void:
	#print("ok")
	var firework_instance = firework_scene.instance()
	get_tree().get_root().add_child(firework_instance)
	firework_instance.global_position = Vector2(rand_range(0, 1024), rand_range(0, 600))


func _on_MainMenuButton_pressed() -> void:
	$FireworkTimer.stop()
	$FireworkTimer2.stop()
	$FireworkTimer3.stop()
	$FireworkTimer4.stop()
	$FireworkTimer5.stop()
	Transition.load_scene("res://Scenes/MainMenu.tscn")