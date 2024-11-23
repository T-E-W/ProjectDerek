extends Skill
class_name Ultimate
 
func _init(target):
	cooldown = 1.0
	texture = preload("res://art/icons/skill_icons/48x48/skill_icons13.png")
	animation_name = "Ultimate"
 
	super._init(target)
 
 
func cast_spell(target):
	super.cast_spell(target)
	target.radial(18)
