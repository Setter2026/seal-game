extends Node2D

@export var float_height: float = 15.0   
@export var float_speed: float = 2.0     
@export var tilt_angle: float = 5.0      
@export var squish_amount: float = 0.08  

var start_y: float
var base_scale: Vector2
var time: float = 0.0

func _ready() -> void:
	start_y = position.y
	base_scale = scale
	
	time = randf() * TAU 

func _process(delta: float) -> void:
	time += delta * float_speed
	
	var wave: float = sin(time)
	position.y = start_y + wave * float_height
	
	rotation_degrees = cos(time * 0.5) * tilt_angle
	
	var pulse: float = cos(time) * squish_amount
	scale = Vector2(base_scale.x + pulse, base_scale.y - pulse)
