extends Node

var files = File.new()
var dirs = Directory.new()


func save_data(file_name,data):
	files.open_encrypted_with_pass("user://"+file_name, File.WRITE, '!')
	files.store_var(data)
	files.close()

func load_data(file_name):
	files.open_encrypted_with_pass("user://"+file_name, File.READ, '!')
	var content = files.get_var()
	files.close()
	return content

	
