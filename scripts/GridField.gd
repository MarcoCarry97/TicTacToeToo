class_name GridField
extends PanelContainer

enum State
{
	Playing,
	Controlling,
	Result
}

var current_turn:Square.Symbol
var state:State


var textView:Label
var grid:GridContainer
var matrix:Matrix


func on_square_click(x:int, y:int):
	var on_click=func():
		var index=x*grid.columns+y
		var child=grid.get_child(index)
		if(child.get_symbol()!=Square.Symbol.NONE):
			return
		child.set_symbol(current_turn)
		switch_turn()
		state=State.Controlling
	return on_click
		
func switch_turn():
	if(current_turn==Square.Symbol.CIRCLE):
		current_turn=Square.Symbol.CROSS
	else:
		current_turn=Square.Symbol.CIRCLE

# Called when the node enters the scene tree for the first time.
func _ready():
	state=State.Playing
	current_turn=Square.Symbol.CIRCLE
	textView = $"HBoxContainer/VBoxContainer/Label"
	change_turn_text()
	grid = $"HBoxContainer/MarginContainer/GridContainer"
	matrix = Matrix.new(grid.columns,grid.columns)
	for i in range(0,matrix.x):
		for j in range(0,matrix.y):
			var cell_index:int=i*grid.columns+j
			var square:Square=grid.get_child(cell_index)
			square.set_coords(i,j)
			square.on_click.connect(on_square_click(i,j))
	
func clear():
	_ready()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(state==State.Playing):
		playing_state()
	elif(state==State.Controlling):
		controlling_state()
	elif(state==State.Result):
		result_state()

func check_lines():
	return false

func check_columns():
	return false
	
func check_squares():
	return false

func change_turn_text():
	var text:String="Turn of: "
	if(current_turn==Square.Symbol.CIRCLE):
		text+="O"
	elif(current_turn==Square.Symbol.CROSS):
		text+="X"
	textView.text=text

func playing_state():
	change_turn_text()
	
func controlling_state():
	var res_line:bool=check_lines()
	var res_col:bool=check_columns()
	var res_square:bool=check_squares()
	var res:bool=res_line or res_col or res_square
	if(res):
		state=State.Result
	else:
		state=State.Playing
	
func result_state():
	pass
	

	
