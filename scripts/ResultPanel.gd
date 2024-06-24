extends PanelContainer

var resultText
var playAgainButton
var closeButton

# Called when the node enters the scene tree for the first time.
func _ready():
	resultText=$"VBoxContainer/ResultText"
	playAgainButton=$"VBoxContainer/HBoxContainer/PlayAgainButton"
	closeButton=$"VBoxContainer/HBoxContainer/CloseButton"
	playAgainButton.connect("pressed",on_play_again)
	closeButton.connect("pressed",on_close)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func on_play_again():
	get_parent().play_again.emit()
	get_parent().start_game.emit()
	hide()

func on_close():
	get_parent().clear_game.emit()
	get_parent().active_panel("StartPanel")
	hide()
