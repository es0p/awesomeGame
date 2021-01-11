extends KinematicBody

const ACCELERATION = 0.7
const SPEED = 5.0
const FRICTION = 2.0

var velocity = Vector3.ZERO

func _physics_process(delta):
	var input_vector = Vector3.ZERO
	input_vector.z = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
	input_vector.x = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()

	if input_vector != Vector3.ZERO:
		velocity = velocity.move_toward(input_vector * SPEED, ACCELERATION)
	else: 
		velocity = velocity.move_toward(Vector3.ZERO, FRICTION) 
	
	velocity = move_and_slide(velocity)

	
