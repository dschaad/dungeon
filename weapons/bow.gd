extends Area2D

@onready var player  = get_node("/root/Dungeon/Player")
@onready var world = get_node("/root/Dungeon")
var in_range = false

func _physics_process(_delta):
	look_at(player.global_position)

func _on_body_entered(body: Node2D):
	if body == player:
		in_range = true

func _on_body_exited(body: Node2D) -> void:
	if body == player:
		in_range = false

func shoot():
	const ARROW = preload("res://weapons/arrow.tscn")
	var new_arrow = ARROW.instantiate()
	new_arrow.global_position = %ShootingPoint.global_position
	new_arrow.global_rotation = self.global_rotation
	world.add_child(new_arrow) # Unsure if this is the best solution, but it works for the time being

func _on_timer_timeout():
	if in_range:
		shoot()
