extends Control

const ZOOM_LIMIT = Vector2(8 , 8)
const ZOOM_SPEED = Vector2(0.1 , 0.1)

var scene_change = false
var zoom_done = false
var unlocked = 1
var zoom_position
var scene_load

@onready var cam = $Camera2D
@onready var color_rect = $ButtonLvl2/ColorRect
@onready var sprite_2d = $ButtonLvl2/Sprite2D
@onready var color_rect_2 = $ButtonLvl3/ColorRect
@onready var sprite_2d_2 = $ButtonLvl3/Sprite2D

func _physics_process(delta):
	zoom_process()
	if zoom_done == true:
		play_transition()
		await get_tree().create_timer(0.5).timeout
		zoom_done = false
	unlocker()

func zoom_process():
	if cam.zoom < ZOOM_LIMIT && scene_change == true:
		cam.position = zoom_position
		cam.zoom += ZOOM_SPEED
		if cam.zoom >= ZOOM_LIMIT:
			zoom_done = true

func play_transition():
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	## get_tree().change_scene_to_file()

func _on_firstlvl_pressed():
	scene_change = true
	zoom_position = Vector2(580 , 457)
	## scene_load = " "

func _on_2ndlvl_pressed():
	if unlocked >= 1:
		scene_change = true
		zoom_position = Vector2(579 , 279)
		## scene_load = " "
	
func _on_3rdlvl_pressed():
	if unlocked >= 2:
		scene_change = true
		zoom_position = Vector2(579 , 138)

func unlocker():
	if unlocked >= 1:
		color_rect.visible = false
		sprite_2d.visible = false
	elif unlocked >= 2:
		color_rect_2.visible = false
		sprite_2d_2.visible = false
