%[rectPositionings].
%rectPositioningsInPoint(50,49,rect(0,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), 1, 1),Result).
%rectPositionings(rect(0,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), 1, 1), [], Result). 
%rectPositionings(rect(1,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), 1, 1), [rect(0,vertex(0,10,10),vertex(1,15,10),vertex(2,15,11),vertex(3,10,11), 5, 1)], Result).
%rectPositionings(rect(1,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), 1, 1), [rect(0,vertex(0,10,10),vertex(1,11,10),vertex(2,11,11),vertex(3,10,11), 1, 1)], Result).
%rectPositionings(rect(1,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), 1, 1), [rect(0,vertex(0,10,10),vertex(1,11,10),vertex(2,11,11),vertex(3,10,11), 1, 1),rect(1,vertex(0,10,10),vertex(1,11,10),vertex(2,11,11),vertex(3,10,11), 1, 1)], Result).

:-include('perimeterPoints.pl').


%True if the rectangle with zero index is located in the center (1000,1000)
rectPositionings(rect(I,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), B, H), [], [rect(I,vertex(0,X,Y),vertex(1,X1,Y),vertex(2,X1,Y1),vertex(3,X,Y1), B, H)])
:-
	X#=1000,
	Y#=1000,
	X1 #= X+B,
	Y1 #= Y+H
.

%True if RectPositionings contains all the possible positioning (including not valid) of "rect" depending on already Positioned rectangles
rectPositionings(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H), [rect(I,vertex(0,X00,Y00),vertex(1,X11,Y11),vertex(2,X22,Y22),vertex(3,X33,Y33), B2, H2)|Positioned], RectPositionings)
:-
	
	%PositioningPerimeterPoints contains all the perimeter points of the already placed rectangles
	positioningPerimeterPoints([rect(I,vertex(0,X00,Y00),vertex(1,X11,Y11),vertex(2,X22,Y22),vertex(3,X33,Y33), B2, H2)|Positioned], PositioningPerimeterPoints),
	%remove duplicates perimeter points	
	removeDuplicates(PositioningPerimeterPoints, PositioningPerimeterPointsWithNoDuplicates,_),	
	%place "rect" in every perimeter point	
	rectPositioningsAux(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H), PositioningPerimeterPointsWithNoDuplicates, RectPositionings)	
.

%True if RectPositionings contains all the possible positioning (including not valid) of "rect" in every PerimeterPoint
%Base case: rect has no positioning if there aren't already positioned rectangles
rectPositioningsAux(rect(_,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), _, _), [], []).
%Recursively place rect in every point 
rectPositioningsAux(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H), [point(W,Z)|PerimetersPoints], RectPositionings)
:-
	%place rect in the point in the head	
	rectPositioningsInPoint(W,Z,rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H) , RectPositioningsInHeadPoint),
	%recursive call	
	rectPositioningsAux(rect(R,vertex(0,X00,Y00),vertex(1,X11,Y00),vertex(2,X11,Y11),vertex(3,X00,Y11), B, H), PerimetersPoints, RectPositioningsInTailPoints),
	append(RectPositioningsInHeadPoint,RectPositioningsInTailPoints, RectPositionings)
.


%True if the list of Positionigs (4th term) mantains rectangles dimensions for every positioning	
rectPositioningsInPoint(
	X,Y,
	rect(R,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), B, H) ,
	[
		rect(R,vertex(0,X,Y),vertex(1,X1,Y),vertex(2,X1,Y1),vertex(3,X,Y1), B, H),
		rect(R,vertex(0,X,Y4),vertex(1,X1,Y4),vertex(2,X1,Y),vertex(3,X,Y), B, H),
		rect(R,vertex(0,X,Y),vertex(1,X2,Y),vertex(2,X2,Y2),vertex(3,X,Y2), B, H),
		rect(R,vertex(0,X,Y3),vertex(1,X2,Y3),vertex(2,X2,Y),vertex(3,X,Y), B, H),

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





