class_name StartPanel
extends PanelContainer

var play_button:Button
var quit_button:Button




# Called when the node enters the scene tree for the first time.
func _ready():
	play_button=$PanelMargin/PanelContent/ButtonContainer/PlayButtonMargin/PlayButton
	quit_button=$PanelMargin/PanelContent/ButtonContainer/QuitButtonMargin/QuitButton
	play_button.pressed.connect(_on_play)
	quit_button.pressed.connect(_on_quit)

func _on_play():
	hide()

func _on_quit():
	get_tree().quit()
