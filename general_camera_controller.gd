extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var magnitude = 0.3
	
	# Free movement
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		if Input.is_key_pressed(KEY_W):
			%CameraFocalPoint.global_translate(-global_transform.basis.z * magnitude)
		if Input.is_key_pressed(KEY_S):
			%CameraFocalPoint.global_translate(global_transform.basis.z * magnitude)
		if Input.is_key_pressed(KEY_A):
			%CameraFocalPoint.global_translate(-global_transform.basis.x * magnitude)
		if Input.is_key_pressed(KEY_D):
			%CameraFocalPoint.global_translate(global_transform.basis.x * magnitude)
	

func _input(event):
	# Free rotation
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		if event is InputEventMouseMotion:
			rotate(Vector3.UP, -deg_to_rad(0.2 * event.relative.x))
			rotate(basis.x, -deg_to_rad(0.2 * event.relative.y))

			%CameraFocalPoint.global_transform = %FreeRotationFocalPoint.global_transform
			look_at(%CameraFocalPoint.global_position)

	# Focal point rotation
	elif Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE):
		if event is InputEventMouseMotion:
			%CameraFocalPoint.rotate(Vector3.UP, -deg_to_rad(0.2 * event.relative.x))
			%CameraFocalPoint.rotate(%CameraFocalPoint.basis.x, -deg_to_rad(0.2 * event.relative.y))
