extends Node2D


func _physics_process(_delta: float) -> void:
	if Globals.is_finished:
		$FinishTimer.start()


func _on_FinishTimer_timeout():
	queue_free()