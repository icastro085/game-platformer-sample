tool
extends Button

export(String, FILE) var next_scene_path: String = ""

func _on_PlayButton_button_up() -> void:
	get_tree().change_scene(next_scene_path)

func _get_configuration_warning() -> String:
	return "next scene must be set for the button to work" if not next_scene_path else ""
