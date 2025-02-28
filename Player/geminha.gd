extends CharacterBody2D

const SPEED = 75.0
@onready var GunObj = $Gun

func _physics_process(delta: float) -> void:
	
	GunObj.look_at(get_global_mouse_position())
	
	if get_global_mouse_position().x > self.position.x:
		$Sprite.flip_h = false
		$Gun/Sprite.flip_v = false
	else:
		$Sprite.flip_h = true
		$Gun/Sprite.flip_v = true

	var direcX := Input.get_axis("ui_left", "ui_right")
	var direcY := Input.get_axis("ui_up", "ui_down")
	var direc = Vector2(direcX, direcY)
	if direc:
		velocity = direc * SPEED
		$Anim.play("Walk")
	else:
		velocity = Vector2.ZERO
		$Anim.play("Idle")

	move_and_slide()
