class_name GridField
extends PanelContainer

enum State
{
	Preparing,
	Playing,
	Controlling,
	Result,
	Finished
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
		matrix.set_value(x,y,current_turn)
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
	state=State.Preparing
	current_turn=Square.Symbol.CIRCLE
	textView = $"HBoxContainer/VBoxContainer/Label"
	change_turn_text()
	grid = $"HBoxContainer/MarginContainer/GridContainer"
	matrix = Matrix.new(grid.columns,grid.columns)
	for i in range(0,matrix.x):
		for j in range(0,matrix.y):
			var cell_index:int=i*grid.columns+j
			var square:Square=grid.get_child(cell_index)
			square.clear()
			square.set_coords(i,j)
			square.on_click.connect(on_square_click(i,j))
	state=State.Playing
	
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

func check(array):
	var res=array[0]!=Matrix.VOID
	for i in range(1,len(array)):
		if(res):
			if(array[i]==Matrix.VOID):
				res=false
			elif(array[i]!=array[i-1]):
				res=false
	return res

func check_lines():
	var victory:bool=false
	for i in range(0,matrix.x):
		var line=matrix.get_line(i)
		victory=victory or check(line)
		#print(line)
	return victory

func check_columns():
	var victory:bool=false
	for i in range(0,matrix.x):
		var col=matrix.get_column(i)
		victory=victory or check(col)
		#print(col)
	return victory
	
func check_squares():
	var victory:bool=false
	for i in range(0,matrix.x-1):
		for j in range(0,matrix.y-1):
			var line=matrix.get_square(i,j)
			victory=victory or check(line)
	return victory

func check_diagonals():
	var diag=matrix.get_diagonal()
	var opp=matrix.get_opposite_diagonal()
	print(diag)
	print(opp)
	return check(diag) or check(opp)

func check_victory():
	var res_line:bool=check_lines()
	var res_col:bool=check_columns()
	var res_square:bool=check_squares()
	var res_diags:bool=check_diagonals()
	var res:bool=res_line or res_col or res_square or res_diags
	return res

func check_tie():
	var res=true
	for i in range(0,matrix.x):
		for j in range(0,matrix.y):
			res=res and matrix.get_value(i,j)!=Matrix.VOID
	return res

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
	matrix.print()
	var victory=check_victory()
	var tie=check_tie()
	if(victory or tie):
		state=State.Result
	else:
		state=State.Playing
	
func result_state():
	show_result_panel()
	state=State.Finished

func show_result_panel():
	var text="Tie"
	if(check_victory()):
		text="Victory of "
		if(current_turn==Square.Symbol.CIRCLE):
			text+="X"
		else:
			text+="O"
	get_parent().show_result.emit(text)
