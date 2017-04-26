locateRectInPoint(
	rect(R,vertex(0,X,Y),vertex(0,_,_),vertex(2,_,_),vertex(3,_,_), B, H) ,
	[
		rect(R,vertex(0,X,Y),vertex(0,X1,Y),vertex(2,X1,Y1),vertex(3,X,Y1), B, H),
		rect(R,vertex(0,X,Y),vertex(0,X1,Y),vertex(2,X1,Y4),vertex(3,X,Y4), B, H),
		rect(R,vertex(0,X,Y),vertex(0,X2,Y),vertex(2,X2,Y2),vertex(3,X,Y2), B, H),
		rect(R,vertex(0,X,Y),vertex(0,X2,Y),vertex(2,X2,Y3),vertex(3,X,Y3), B, H),

		rect(R,vertex(0,X,Y),vertex(0,X3,Y),vertex(2,X3,Y1),vertex(3,X,Y1), B, H),
		rect(R,vertex(0,X,Y),vertex(0,X3,Y),vertex(2,X3,Y4),vertex(3,X,Y4), B, H),
		rect(R,vertex(0,X,Y),vertex(0,X4,Y),vertex(2,X4,Y2),vertex(3,X,Y2), B, H),
		rect(R,vertex(0,X,Y),vertex(0,X4,Y),vertex(2,X4,Y3),vertex(3,X,Y3), B, H)
		
	]
):- 	X1 #= X+B,
	Y1 #= Y+H,
	X2 #= X+H,
	Y2 #= Y+B,
	X3 #= X-B,
	Y3 #= Y-B,
	X4 #= X-H,
	Y4 #= Y-H
. 
