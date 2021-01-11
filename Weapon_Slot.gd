extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var Arrow = preload("res://assets/weapons/arrow.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func fire():
	print("triggered!!!!")
	print(get_child(0).name)
	if(get_child(0).name == "BOW"):
		print("is BOW", get_global_transform().origin)
		var b = Arrow.instance()
		b.rotation = global_transform.basis.get_euler()
		var projectilePosition = get_global_transform()
		#projectilePosition = get_translation()
		b.transform = Transform(projectilePosition)
		b.transform.origin.y = 0.6
		#b.position = get_tree().get_root().get_node("Player_Transform").position
		get_tree().get_root().get_node("Level").add_child(b)
	
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
