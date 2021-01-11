extends RigidBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var ARROW_SPPED = 400
var ARROW_DIRECTION = Vector3.ZERO
# Called when the node enters the scene tree for the first time.
var velocity = Vector3.ZERO
var direction = Vector3.ZERO

var _timer = null



func _ready():
	set_meta("type", "projectile")
	var input_vector = Vector3.ZERO
	input_vector = input_vector.normalized()
	direction = -get_global_transform().basis.z * ARROW_SPPED
	velocity = direction * Vector3(1,1,1) + Vector3(0,500,0)
	add_force(velocity,Vector3.ZERO)
	set_gravity_scale(1)
	_timer = Timer.new()
	add_child(_timer)

	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(.2)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()


func _integrate_forces(state):
	#var xform = state.linear_velocity
	#set_global_transform(xform.normalized())
	var xform = state.linear_velocity
	xform = xform.normalized()
	look_at(state.transform.origin + xform, Vector3.UP)


func _on_Timer_timeout():
	var lin_vel = get_linear_velocity();

	#print("x: ",get_linear_velocity().x, "   y: ",get_linear_velocity().y,"   z: ",get_linear_velocity().z, " normalized:",get_linear_velocity().normalized())
