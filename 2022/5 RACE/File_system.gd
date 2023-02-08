extends Node

var files  = File.new()
var dirs = Directory.new()

func save_data(file_name, data):
	files.open_encrypted_with_pass("user://"+file_name,File.WRITE,"pass")
	files.store_var(data)
	files.close()
	
func load_data(file_name):
	files.open_encrypted_with_pass("user://"+file_name,File.READ,"pass")
	var content = files.get_var()
	files.close()	
	return content
	
func file_exists(file_name):
	if files.file_exists("user://"+file_name):
		return true
	else:
		return false
