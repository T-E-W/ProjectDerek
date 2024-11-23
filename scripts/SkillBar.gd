extends HBoxContainer
 
var slots : Array
var skills : Array = [FireShot, WaterBall, Tornado, DarkBall, Ultimate]
 
func _ready():
	slots = get_children()
	for i in get_child_count():
		slots[i].change_key = str(i+1)
		slots[i].skill = skills[i].new(slots[i])
	