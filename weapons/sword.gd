extends Marker2D

func _on_sword_body_entered(body: Node2D):
	if body.has_method("hit"):
		body.hit()
