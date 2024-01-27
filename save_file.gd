extends Node2D

const SAVE_FILE = "user://savegame.save"
var gamedata = {}

func save_data():
	var file=File.new()
	file.open(SAVE_FILE, file.WRITE)
	file.store_var(gamedata)
	file.close()

func load_data():
	var file = File.new()
	if not file.file_exist(SAVE_FILE):
		gamedata = {
			"username":"",
			"hitpoint": 100,
			"gold": 0,
			"experience": 0,
			"equipment": {
				"head": null,
				"body": null,
				"pants": null,
				"back": null
			},
			"weapons": {
				"lefthand": null,
				"righthand": null
			},
			"backpack": {
				"type": "1",
				"data": []
			}
		}
		save_data()
	file.open(SAVE_FILE)
	gamedata = file.get_var()
	file.close()
