extends CanvasLayer

var _panels:Array
var _names:Array
var _stack:Array

signal start_game

signal play_again

signal clear_game

# Called when the node enters the scene tree for the first time.
func _ready():
	_names=[]
	_panels=get_children()
	_stack=[]
	for child in _stack:
		_names.append(child.name)
		child.hide()
	#for child in _panels:
	#	child.hide()
	active_panel("StartPanel")
	get_parent().get_node("GameBoard").show_result.connect(show_result_panel)
	play_again.connect(clear_gameboard)
	clear_game.connect(clear_gameboard)

func active_panel(name:String):
	var index:int=_names.find(name)
	if index>-1:
		var panel:PanelContainer = _panels[index]
		panel.show()
		if len(_stack)>0:
			_stack[0].hide()
		_stack.insert(0,panel)
		
func deactive_panel():
	_stack[0].hide()
	_stack.remove_at(0)
	if len(_stack)>0:
		_stack[0].show()
	
func get_active_panel():
	return _stack[len(_stack)-1]
	
func clear():
	_ready()

func show_result_panel(text):
	#deactive_panel()
	active_panel("ResultPanel")
	var panel=$ResultPanel
	panel.resultText.text=text
	panel.show()
	
func clear_gameboard():
	get_parent().get_node("GameBoard").get_child(0).clear()
	clear()
