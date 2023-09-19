extends Node2D


export(String, FILE, "*tscn") var target_stage

onready var target_stage_new := {
	"scene_2" : "res://Second scene.tscn"
	}




func _ready():
	pass 


func _on_ChangeStage_body_entered(body):
	print("test")
	if body.name == "player":
		get_tree().change_scene(target_stage_new.scene_2)
		print("player")
