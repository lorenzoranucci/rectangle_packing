%[posiziona8modi].
%locateRectInPoint(50,50,rect(R,vertex(0,X0,Y0),vertex(1,X1,Y1),vertex(2,X2,Y2),vertex(3,X3,Y3), 6, 10) , Result).

locateRectInPoint(
	X,Y,
	rect(R,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), B, H) ,
	[
		rect(R,vertex(0,X,Y),vertex(1,X1,Y),vertex(2,X1,Y1),vertex(3,X,Y1), B, H),
		rect(R,vertex(0,X,Y4),vertex(1,X1,Y4),vertex(2,X1,Y),vertex(3,X,Y), B, H),
		rect(R,vertex(0,X,Y),vertex(1,X2,Y),vertex(2,X2,Y2),vertex(3,X,Y2), B, H),
		rect(R,vertex(0,X,Y),vertex(1,X2,Y),vertex(2,X2,Y3),vertex(3,X,Y3), B, H),

		rect(R,vertex(0,X3,Y),vertex(1,X,Y),vertex(2,X,Y1),vertex(3,X3,Y1), B, H),
		rect(R,vertex(0,X3,Y4),vertex(1,X,Y4),vertex(2,X,Y),vertex(3,X3,Y), B, H),
		rect(R,vertex(0,X4,Y),vertex(1,X,Y),vertex(2,X,Y2),vertex(3,X4,Y2), B, H),
		rect(R,vertex(0,X4,Y3),vertex(1,X,Y3),vertex(2,X,Y),vertex(3,X4,Y), B, H)
		
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
