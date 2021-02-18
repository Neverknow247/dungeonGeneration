extends KinematicBody2D

const ACCELERATION = 650
const MAX_SPEED = 100

enum {
	IDLE,
	CHASE
}

onready var playerDetectionZone =$PlayerDetectionZone

var velocity = Vector2.ZERO

var state = IDLE

var stats = Stats

func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	match state:
		IDLE:
			velocity = velocity.linear_interpolate(Vector2.ZERO, 0.5)
			seek_player()
			
		CHASE:
			var player = playerDetectionZone.get_player()
			if player != null:
				accelerate_to_point(player.global_position, ACCELERATION * delta)
			else:
				state = IDLE
				
	update_position()

func seek_player():
	state = CHASE

func _on_PickupArea_body_entered(_body: Node) -> void:
	stats.teeth += 1
	stats.totalTeethCollected += 1
	queue_free()

func update_position():
	velocity = move_and_slide(velocity)

func accelerate(acceleration_vector):
	velocity += acceleration_vector
	velocity = velocity.clamped(MAX_SPEED)

func accelerate_to_point(point, acceleration_scalar):
	var direction = (point - global_position).normalized()
	var acceleration_vector = direction * acceleration_scalar
	accelerate(acceleration_vector)

func _on_PlayerDetectionZone_body_entered(_body: Node) -> void:
	state = CHASE
