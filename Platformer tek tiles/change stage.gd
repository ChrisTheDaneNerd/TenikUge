extends Node2D


export(String, FILE, "*tscn") var target_stage



func _ready():
	pass 


func _on_ChangeStage_body_entered (body):
	if "player" in body.name:
		get_tree().change_scene_(target_stage)