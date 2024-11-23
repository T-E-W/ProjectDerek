extends CharacterBody2D
 
@export var projectile_node : PackedScene

var speed = 200
var player_state


func _physics_process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x == 0 and direction.y == 0:
		player_state = "idle"
		
	elif direction.x != 0 or direction.y != 0:
		player_state = "walking"
		
	velocity = direction * speed
	move_and_slide()
	
	play_anim(direction)
	
func play_anim(dir):
	if player_state == "idle":
		$AnimatedSprite2D.play("idle")
	if player_state == "walking":
		if dir.y == -1:
			$AnimatedSprite2D.play("n-walk")
		if dir.y == 1:
			$AnimatedSprite2D.play("s-walk")
		if dir.x == 1:
			$AnimatedSprite2D.play("e-walk")
		if dir.x == -1:
			$AnimatedSprite2D.play("w-walk")
		
		if dir.x > 0.5 and dir.y < -0.5:
			$AnimatedSprite2D.play("ne-walk")
		if dir.x > 0.5 and dir.y > 0.5:
			$AnimatedSprite2D.play("se-walk")
		if dir.x < -0.5 and dir.y > 0.5:
			$AnimatedSprite2D.play("sw-walk")
		if dir.x < -0.5 and dir.y < -0.5:
			$AnimatedSprite2D.play("nw-walk") 

func single_shot(animation_name = "Fire"):
	var projectile = projectile_node.instantiate()
 
	projectile.play(animation_name)
 
	projectile.position = global_position
	projectile.direction = (get_global_mouse_position() - global_position).normalized()
 
	get_tree().current_scene.call_deferred("add_child",projectile)
 	
 
func multi_shot(count: int = 3, delay: float = 0.3, animation_name = "Fire"):
	for i in range(count):
		single_shot(animation_name)
		await get_tree().create_timer(delay).timeout
 
func angled_shot(angle,i):
	var projectile = projectile_node.instantiate()
 
	if i % 2 == 0:
		projectile.play("Dark")
	else:
		projectile.play("Fire")
 
	projectile.position = global_position
	projectile.direction = Vector2(cos(angle),sin(angle))
 
	get_tree().current_scene.call_deferred("add_child",projectile)
 
 
func radial(count):
	for i in range(count):
		angled_shot( (float(i) / count ) * 2.0 * PI, i )
