class_name Matrix

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
			line.append(-1)
		matrix.append([line])
	self.matrix=matrix

func clear():
	for i in range(0,self.x):
		for j in range(0,self.y):
			self.matrix[i][j]=-1
