extends CanvasLayer

var _panels:Array
var _names:Array
var _stack:Array

# Called when the node enters the scene tree for the first time.
func _ready():
	_names=[]
	_panels=get_children()
	_stack=[]
	for child in _stack:
		_names.append(child.name)
		child.hide()
	active_panel("StartPanel")

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
	
func clear():
	_ready()
