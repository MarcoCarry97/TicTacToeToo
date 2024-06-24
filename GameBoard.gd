extends CanvasLayer

signal show_result(test)


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	activate.connect(active)
	get_parent().get_node("PanelController").start_game.connect(active)
	get_parent().get_node("PanelController").play_again.connect(clear)
	get_parent().get_node("PanelController").clear_game.connect(hide_gameboard)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func active():
	show()
	
func clear():
	var grid=get_child(0)
	grid.clear()
	
func hide_gameboard():
	hide()
	get_parent().get_child(0).active_panel("StartPanel")
	get_parent().get_child(0).get_node("StartPanel").show()
signal activate
