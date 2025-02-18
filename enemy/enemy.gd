extends CharacterBody2D

@onready var player  = get_node("/root/Dungeon/Player")

var health = 3

func _physics_process(_delta):
	look_at(player.global_position)

func hit():
	health -= 1
	
	if health <= 0:
		queue_free()
