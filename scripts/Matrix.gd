class_name Matrix

const VOID=-1

var x:int
var y:int
var matrix:Array

func _init(x,y):
	self.x=x
	self.y=y
	var matrix=Array()
	for i in range(0,x):
		var line=Array()
		for j in range(0,y):
			line.append(VOID)
		matrix.append(line)
	self.matrix=matrix

func clear():
	for i in range(0,self.x):
		for j in range(0,self.y):
			self.matrix[i][j]=VOID

func get_value(i:int,j:int):
	return matrix[i][j]
	
func set_value(i:int,j:int,value):
	matrix[i][j]=value
	
func get_line(i:int):
	return matrix[i]
	
func get_column(i:int):
	var col:Array=Array()
	for j in range(0,x):
		col+=[get_value(j,i)]
	return col
	
func get_square(i:,j:int):

	var square=Array()
	square+=[get_value(i,j)]
	square+=[get_value(i+1,j)]
	square+=[get_value(i,j+1)]
	square+=[get_value(i+1,j+1)]
	return square

func get_diagonal():
	var diagonal=Array()
	for i in range(0,x):
		diagonal+=[get_value(i,i)]
	return diagonal
	
func get_opposite_diagonal():
	var diagonal=Array()
	for i in range(x-1,-1,-1):
		diagonal+=[get_value(i,x-i-1)]
	return diagonal
	
func print():
	for i in range(0,x):
		print(matrix[i])
	print("\n")
			

