extends Skill
class_name DarkBall
 
func _init(target):
	cooldown = 1.0
	texture = preload("res://art/icons/skill_icons/48x48/skill_icons29.png")
	animation_name = "Dark"
 
	super._init(target)
 
 
func cast_spell(target):
	super.cast_spell(target)
	target.multi_shot(4,0.2,animation_name)
