%[locateRectInPerimeterPoints].
%locateRectInPerimeterPoints(rect(0,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), 1, 1), [], Result). 
%locateRectInPerimeterPoints(rect(1,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), 1, 1), [rect(0,vertex(0,10,10),vertex(1,15,10),vertex(2,15,11),vertex(3,10,11), 5, 1)], Result).
%locateRectInPerimeterPoints(rect(1,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), 1, 1), [rect(0,vertex(0,10,10),vertex(1,11,10),vertex(2,11,11),vertex(3,10,11), 1, 1)], Result).
%locateRectInPerimeterPoints(rect(1,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), 1, 1), [rect(0,vertex(0,10,10),vertex(1,11,10),vertex(2,11,11),vertex(3,10,11), 1, 1),rect(1,vertex(0,10,10),vertex(1,11,10),vertex(2,11,11),vertex(3,10,11), 1, 1)], Result).



%locate first rect in the center
locateRectInPerimeterPoints(rect(0,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), B, H), [], [rect(0,vertex(0,X,Y),vertex(1,X1,Y),vertex(2,X1,Y1),vertex(3,X,Y1), B, H)])
:-
	X#=1000,
	Y#=1000,
	X1 #= X+B,
	Y1 #= Y+H
.

locateRectInPerimeterPoints(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H), Positioned, Result)
:-
	R#\=0,
	getAllPerimetersPoints(Positioned,PerimetersPoints),	
	locateRectInPerimeterPointsAux(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H), PerimetersPoints, Result)	
.

locateRectInPerimeterPointsAux(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H), [], []).
locateRectInPerimeterPointsAux(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H), [point(W,Z)|PerimetersPoints], Result)
:-
	locateRectInPoint(W,Z,rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H) , SubResult1),
	locateRectInPerimeterPointsAux(rect(R,vertex(0,X00,Y00),vertex(1,X11,Y00),vertex(2,X11,Y11),vertex(3,X00,Y11), B, H), PerimetersPoints, SubResult2),
	append(SubResult1,SubResult2, Result)
.


	
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


:-include('getPerimeterPoints.pl').


