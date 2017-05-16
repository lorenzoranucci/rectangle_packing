% gprolog 
% consult(rectangles).


solution([]).
solution([rect(0,vertex(0,X0,Y0),vertex(0,X1,Y1),vertex(2,X2,Y2),vertex(3,X3,Y3), B, H)|Tail]):-
	solutionAux(
		rect(RectToLocate,vertex(0,X1_0,Y1_0),vertex(0,X1_1,Y1_1),vertex(2,X1_2,Y1_2),vertex(3,X1_3,Y1_3), B1, H1),
		[rect(0,vertex(0,X0,Y0),vertex(0,X1,Y1),vertex(2,X2,Y2),vertex(3,X3,Y3),B,H)|Tail],
		[
			rect(0,
				vertex(0,CENTER,CENTER),
				vertex(0,CENTER+B,CENTER),
				vertex(2,CENTER+,CENTER+H),
				vertex(3,CENTER,CENTER+H),
				B,
				H
			)
		]
	)
.

solutionAux([],Rects,PositionedRects).
solutionAux(rect(RectToLocate,vertex(0,X1_0,Y1_0),vertex(0,X1_1,Y1_1),vertex(2,X1_2,Y1_2),vertex(3,X1_3,Y1_3), B1, H1), Rects, PositionedRects):- 
	areWellPositioned(
		[
			rect(RectToLocate,
				vertex(0,X1_0,Y1_0),
				vertex(0,X1_1,Y1_1),
				vertex(2,X1_2,Y1_2),
				vertex(3,X1_3,Y1_3), B1, H1
			)
			|
			PositionedRects
		]
	), 
	areMaxPositioned(
		rect(RectToLocate,
			vertex(0,X1_0,Y1_0),
			vertex(0,X1_1,Y1_1),
			vertex(2,X1_2,Y1_2),
			vertex(3,X1_3,Y1_3), B1, H1
		),
		Rects,
		PositionedRects
	), 
	

	member(OneRectToLocate, Rects),
	not member(OneRectToLocate, PositionedRects),
	OneRectToLocate!=RectToLocate,
	solutionAux(
		rect(OneRectToLocate,
			vertex(0,X1_0,Y1_0),
			vertex(0,X1_1,Y1_1),
			vertex(2,X1_2,Y1_2),
			vertex(3,X1_3,Y1_3), B1, H1
		),
		Rects,
		[
			rect(RectToLocate,
				vertex(0,X1_0,Y1_0),
				vertex(0,X1_1,Y1_1),
				vertex(2,X1_2,Y1_2),
				vertex(3,X1_3,Y1_3), B1, H1
			)
			|
			PositionedRects
		]
	)
.



