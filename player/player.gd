extends CharacterBody2D

var speed = 400
var health = 3

func get_input():
	look_at(get_global_mouse_position())
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
func _physics_process(_delta):
	get_input()
	move_and_slide()

func hit():
	health -= 1
	
	if health <= 0:
		print("DEAD")
