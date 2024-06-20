class_name PausePanel
extends PanelContainer

var continueButton:Button
var quitButton:Button

# Called when the node enters the scene tree for the first time.
func _ready():
	continueButton=$PanelMargin/PanelContent/ButtonContainer/ContinueButtonMargin/ContinueButton
	quitButton=$PanelMargin/PanelContent/ButtonContainer/QuitButtonMargin/QuitButton
	continueButton.pressed.connect(_on_continue)
	quitButton.pressed.connect(_on_quit)


func _on_continue():
	print("CONTINUE!")
	
func _on_quit():
	hide()
	
	
