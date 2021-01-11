extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ARROW_SPPED = 0.3

# Called when the node enters the scene tree for the first time.
var velocity = Vector3.ZERO
func _ready():
	set_meta("type", "projectile")

func _physics_process(delta):
	var input_vector = Vector3.ZERO
	input_vector = input_vector.normalized()
	velocity = -get_global_transform().basis.z * ARROW_SPPED
	velocity = move_and_collide(velocity)	
	if(velocity):

		print(velocity.collider.name)
		var new_parent = velocity.collider
		var colliderPosition = new_parent.transform.origin
		velocity = Vector3.ZERO
		
		set_physics_process(false)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
