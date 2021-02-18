extends KinematicBody2D

const ACCELERATION = 450
const MAX_SPEED = 85

enum {
	IDLE,
#	WANDER,
	CHASE
}

var velocity = Vector2.ZERO

var state = IDLE


onready var playerDetectionZone = $PlayerDetectionZone
onready var StopDetectionZone = $StopDetectionZone
#onready var wanderController = $WanderController

func _physics_process(delta):
	
	match state:
		IDLE:
			velocity = velocity.linear_interpolate(Vector2.ZERO, 0.5)
			seek_player()
#			if wanderController.getTimeLeft() == 0:
#				state = pick_random_state([IDLE,WANDER])
#				wanderController.startWanderTimer(rand_range(1,3))
#
#		WANDER:
#			seek_player()
#			if wanderController.getTimeLeft() == 0:
#				state = pick_random_state([IDLE,WANDER])
#				wanderController.startWanderTimer(rand_range(1,3))
#				global_position.direction_to(wanderController.targetPosition)
#				accelerate_to_point(wanderController.targetPosition, ACCELERATION*delta)
			
		CHASE:
			var player = playerDetectionZone.get_player()
			var tooClose = StopDetectionZone.get_player()
			if tooClose !=null:
				state = IDLE 
			elif player != null:
				var rand = floor(rand_range(-4,5))
				var direction = Vector2(player.global_position.x+rand,player.global_position.y+rand)
#				print(player.global_position)
				accelerate_to_point(direction, ACCELERATION * delta)
			else:
				state = IDLE
	
	update_position()

func seek_player():
		state = CHASE

func accelerate(acceleration_vector):
	velocity += acceleration_vector
	velocity = velocity.clamped(MAX_SPEED)

func accelerate_to_point(point, acceleration_scalar):
	var direction = (point - global_position).normalized()
	var acceleration_vector = direction * acceleration_scalar
#	sprite.flip_h = acceleration_vector.x < 0
	accelerate(acceleration_vector)

func update_position():
	velocity = move_and_slide(velocity)


func _on_StopDetectionZone_body_entered(_body: Node) -> void:
	pass # Replace with function body.
