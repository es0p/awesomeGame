extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var canShoot = true

# Called when the node enters the scene tree for the first time.

func _process(delta):
	
	var position2D = get_viewport().get_mouse_position()
	var dropPlane  = Plane(0,1,0,0)
	var camera = get_viewport().get_camera();
	var position3D = dropPlane.intersects_ray(camera.project_ray_origin(position2D),camera.project_ray_normal(position2D))
	
	#print(position3D)
	look_at(position3D, Vector3(0,1,0))
	
	
	if Input.is_action_just_released("ui_mouseLeft") and canShoot:
			print("Mouse button Left clicked")
			get_node("Weapon_Slot").fire()
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
