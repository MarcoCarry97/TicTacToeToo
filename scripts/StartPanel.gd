class_name StartPanel
extends PanelContainer

var play_button:TextureButton
var quit_button:TextureButton



# Called when the node enters the scene tree for the first time.
func _ready():
	play_button=$PanelMargin/PanelContent/ButtonContainer/PlayButtonMargin/PlayButton
	quit_button=$PanelMargin/PanelContent/ButtonContainer/QuitButtonMargin/QuitButton
	play_button.connect("pressed",_on_play)
	quit_button.connect("pressed",_on_quit)

func _on_play():
	hide()
	get_parent().start_game.emit()

func _on_quit():
	get_tree().quit()
