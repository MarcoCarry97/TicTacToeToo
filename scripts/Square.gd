class_name Square
extends ColorRect

enum Symbol
{
	NONE=-1,
	CIRCLE=0,
	CROSS=4
}

@export var _coords:Vector2i

signal on_click

var _symbol:Symbol

var _textView:Label

var _button:TextureButton

func get_coords():
	return _coords;
	
func set_coords(x:int,y:int):
	_coords=Vector2i(x,y);

func set_symbol(symbol):
	self._symbol=symbol
	
func get_symbol():
	return _symbol

func on_pressed():
	on_click.emit()
	
func clear():
	set_symbol(Symbol.NONE)

# Called when the node enters the scene tree for the first time.
func _ready():
	_symbol=Symbol.NONE
	_coords=Vector2i.ZERO
	_textView=$"MarginContainer/TextureButton/Label"
	_button=$"MarginContainer/TextureButton"
	_button.connect("pressed",on_pressed)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var text=" "
	if(_symbol==Symbol.CIRCLE):
		text="O"
	elif(_symbol==Symbol.CROSS):
		text="X"
	_textView.text=text
