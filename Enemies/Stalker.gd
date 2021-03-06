extends KinematicBody2D

var stats = Stats

const ACCELERATION = 300
const MAX_SPEED = 50
const SoundWave = preload("res://Items/SuperHearing/SoundWaves.tscn")

enum {
	IDLE,
#	WANDER,
	CHASE
}

var velocity = Vector2.ZERO
var knockback = Vector2.ZERO

var state = IDLE


onready var Animator = $Animator
onready var playerDetectionZone = $PlayerDetectionZone
onready var StopDetectionZone = $StopDetectionZone
#onready var wanderController = $WanderController

func _physics_process(delta):
	
	knockback = knockback.linear_interpolate(Vector2.ZERO, 0.1)
	
	match state:
		IDLE:
			velocity = velocity.linear_interpolate(Vector2.ZERO, 0.5)
			seek_player()
			updateAnimations()
			breathe()
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
				accelerate_to_point(player.global_position, ACCELERATION * delta)
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
				Animator.play("IdleDown")
			elif dir.y*-1>dir.x:
				Animator.play("IdleDown")
			else:
				Animator.play("IdleLeft")
		else:
			if dir.y < 0:
				Animator.play("IdleRight")
			elif dir.x*-1>dir.y:
				Animator.play("IdleRight")
			else:
				Animator.play("IdleUp")
#		print(facing)
#		print(dir.x)

func breathe():
	var rand = floor(rand_range(0,100))
	if rand == 0:
		SoundFX.play("StalkerBreathe", rand_range(0.6,1.0),-5)
		if stats.hearingOn == true:
			summonSoundWave()

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

func summonSoundWave():
	var soundWave = SoundWave.instance()
	get_parent().add_child(soundWave)
	soundWave.position = global_position
	var randx = rand_range(-2,2)
	var randy = rand_range(-2,2)
	soundWave.position.x += randx
	soundWave.position.y += randy

func _on_HitBox_body_entered(_body: Node) -> void:
	stats.deathByStalker += 1
	stats.deaths += 1
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Menus/DeathScreen.tscn")
#	body.queue_free()
#	print("DEAD")
