extends KinematicBody2D

var stats = Stats

const ACCELERATION = 300
const MAX_SPEED = 40

enum {
	IDLE,
#	WANDER,
	CHASE
}

var velocity = Vector2.ZERO
var knockback = Vector2.ZERO

var state = IDLE
var idle = true;


onready var Animator = $Animator
onready var playerDetectionZone = $PlayerDetectionZone
#onready var wanderController = $WanderController

func _physics_process(delta):
	
	knockback = knockback.linear_interpolate(Vector2.ZERO, 0.1)
	
	match state:
		IDLE:
			velocity = velocity.linear_interpolate(Vector2.ZERO, 0.1)
			seek_player()
			if idle == false:
				Animator.play("Idle")
				idle = true;
			
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
			if player != null:
				idle = false;
				accelerate_to_point(player.global_position, ACCELERATION * delta)
				updateAnimations()
			else:
				state = IDLE
	
	update_position()

func seek_player():
		state = CHASE

func updateAnimations():
	var player = playerDetectionZone.get_player()
	if player != null:
		var dir = Vector2((player.position.x - self.position.x),(player.position.y - self.position.y))
#		var facing = dir.angle()
		if dir.y < dir.x:
			if dir.x < 0:
				Animator.play("Up")
			elif dir.y*-1>dir.x:
				Animator.play("Up")
			else:
				Animator.play("Right")
		else:
			if dir.y < 0:
				Animator.play("Left")
			elif dir.x*-1>dir.y:
				Animator.play("Left")
			else:
				Animator.play("Down")

func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()

func accelerate(acceleration_vector):
	velocity += acceleration_vector
	velocity = velocity.clamped(MAX_SPEED)

func accelerate_to_point(point, acceleration_scalar):
	var direction = (point - global_position).normalized()
	var acceleration_vector = direction * acceleration_scalar
#	sprite.flip_h = acceleration_vector.x < 0
	accelerate(acceleration_vector)

func update_position():
	knockback = move_and_slide(knockback)
	velocity = move_and_slide(velocity)

func _on_Hurtbox_area_entered(area):
	var knockback_vector = area.get_parent().get_parent().roll_vector # TODO: Clean this
	knockback = knockback_vector * 400

func playStep():
	SoundFX.play("CrawlerStep",rand_range(1.0,1.6),+5)

func _on_HitBox_body_entered(_body: Node) -> void:
	stats.crawlerKills += 1
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/DeathScreen.tscn")
#	body.queue_free()
#	print("DEAD")
