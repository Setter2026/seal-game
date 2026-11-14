extends CharacterBody2D

var shell_count = 6
var heart_count = 3

func _physics_process(delta):
	
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = input_direction * 400
	move_and_slide()
	
	if input_direction.x == 1.0 and input_direction.y == 0.0:
		$Sprite2D.flip_h = true;
		
	elif input_direction.x == -1.0 and input_direction.y == 0.0:
		$Sprite2D.flip_h = false
		
		
func _on_pickup_area_area_entered(area):
	if area.is_in_group("Seashells") and not $HoldSeaShell.visible:
		area.queue_free()
		$HoldSeaShell.visible = true
	
	if area.is_in_group("Container") and $HoldSeaShell.visible:
		$HoldSeaShell.visible = false
		shell_count -= 1
		$CanvasLayer/ShellCountDisplay.text = "Shell needed to collect: " + str(shell_count)
	
	if shell_count == 0:
		$CanvasLayer/ShellCountDisplay.text = ""
		$CanvasLayer/Victory.visible = true;
			
		
	if area.is_in_group("Jellyfish"):
		heart_count -= 1
		if heart_count == 2:
			$"../Heart3".visible = false
		if heart_count == 1:
			$"../Heart2".visible = false
		if heart_count == 0:
			$CanvasLayer/Defeat.visible = true
		
			

func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_bubble_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
