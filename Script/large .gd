extends Sprite

const RADIO = 75
const SMALL_RADIUS = 25

var joystik 
var even_controll= -1


# Called when the node enters the scene tree for the first time.
func _init():
	joystik = position
	
func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			if joystik.distance_to(event.position) < RADIO:
				even_controll = event.index
		elif even_controll != -1:
			if even_controll == event.index:
				even_controll = -1
				$"Small ".position = Vector2()
				$"..".stick_vecto = Vector2()
				$"..".stick_anlog = 0
				$"..".stick_speed = 0
				
	if even_controll != -1 and event is InputEventScreenDrag:
		var dis = joystik.distance_to(event.position)
		if dis + SMALL_RADIUS > RADIO:
			dis = RADIO - SMALL_RADIUS
			var vect = (event.position - joystik).normalized()
			var angl  = event.position.angle_to_point(joystik)
			$"..".stick_vecto = vect
			$"..".stick_anlog = angl
			$"..".stick_speed = dis
			$"Small ".position = vect * dis


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
