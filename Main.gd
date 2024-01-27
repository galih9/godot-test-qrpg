extends Node2D

onready var save_file = SaveFile.gamedata

func _ready():
	SaveFile.load_data()

func _on_play_pressed():
	save_file.username = "test"
	save_file.gold = 1000
	print(save_file)
	SaveFile.save_data()


func _on_exit_pressed():
	 get_tree().quit()
