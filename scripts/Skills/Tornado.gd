extends Skill
class_name Tornado
 
func _init(target):
	cooldown = 1.0
	texture = preload("res://art/icons/skill_icons/48x48/skill_icons24.png")
	animation_name = "Tornado"
 
	super._init(target)
 
 
func cast_spell(target):
	super.cast_spell(target)
	target.single_shot(animation_name)
