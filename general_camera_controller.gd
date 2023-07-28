extends Camera3D

@onready var focal_point = %CameraFocalPoint.global_position


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var magnitude = 0.3
	
	# TODO: free movement (breaks focal point rotation, if not adapted)
#	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
#		if Input.is_key_pressed(KEY_W):
#			translate_object_local(-Vector3(0, 0, magnitude))
#		if Input.is_key_pressed(KEY_S):
#			translate_object_local(Vector3(0, 0, magnitude))
#		if Input.is_key_pressed(KEY_A):
#			translate_object_local(-Vector3(magnitude, 0, 0))
#		if Input.is_key_pressed(KEY_D):
#			translate_object_local(Vector3(magnitude, 0, 0))

	

func _input(event):
	# TODO: free rotation (breaks focal point rotation, if not adapted)
#	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
#		if event is InputEventMouseMotion:
#			rotate(Vector3.UP, -deg_to_rad(0.2 * event.relative.x))
#			rotate(basis.x, -deg_to_rad(0.2 * event.relative.y))
#
#			focal_point = %CameraFocalPoint.global_position
	
	# Focal point rotation (make `elif` when free rotation is added)
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE):
		if event is InputEventMouseMotion:
			
			var new_location = global_transform.origin.rotated(Vector3.UP, - 2 * PI * (event.relative.x / 720))
			new_location = new_location.rotated(global_transform.basis.x.normalized(), - 2 * PI * (event.relative.y / 720))

			# TODO: Prevent jittering around north/south pole
#			if ...:
#				new_location = null

			if new_location:
				global_translate(new_location - global_transform.origin)
				look_at(focal_point, Vector3.UP)
