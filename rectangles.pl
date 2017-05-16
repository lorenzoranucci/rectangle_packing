%gprolog 
%[rectangles].
%solution([rect(0,vertex(0,X0,Y0),vertex(0,X1,Y1),vertex(2,X2,Y2),vertex(3,X3,Y3), 1, 2)]).
%solution([rect(0,vertex(0,X0,Y0),vertex(0,X1,Y1),vertex(2,X2,Y2),vertex(3,X3,Y3), 1, 2) , rect(1,vertex(0,X1_0,Y1_0),vertex(0,X1_1,Y1_1),vertex(2,X1_2,Y1_2),vertex(3,X1_3,Y1_3), 1, 1)]).



center(5).
range(10).

solution([]).
solution([rect(0,vertex(0,X0,Y0),vertex(1,X1,Y1),vertex(2,X2,Y2),vertex(3,X3,Y3), B, H)|Tail]):-
	validPositioning(
		Tail,
		[
			rect(0,
				vertex(0,CENTER,CENTER),
				vertex(1,CENTER+B,CENTER),
				vertex(2,CENTER+B,CENTER+H),
				vertex(3,CENTER,CENTER+H),
				B,
				H
			)
		]
	),
	center(CENTER),
	X0 #= CENTER,
	Y0 #= CENTER,
	
	X1 #= CENTER+B,
	Y1 #= CENTER,

	X2 #= CENTER+B,
	Y2 #= CENTER+H,

	X3 #= CENTER,	
	Y3 #= CENTER+H
.


validPositioning([],PositionedRects).


validPositioning(RectsToLocate, PositionedRects):-
	extract(
		rect(Rect,vertex(0,X0,Y0),vertex(0,X1,Y1),vertex(2,X2,Y2),vertex(3,X3,Y3), B, H),
		RectsToLocate,
		RectsToLocateMinusRect
	),

	areVertexWellPositioned(rect(Rect,vertex(0,X0,Y0),vertex(0,X1,Y1),vertex(2,X2,Y2),vertex(3,X3,Y3), B, H), PositionedRects),	

	validPositioning(
		RectsToLocateMinusRect,
		[rect(Rect,vertex(0,X0,Y0),vertex(0,X1,Y1),vertex(2,X2,Y2),vertex(3,X3,Y3), B, H)|PositionedRects]
	),
	range(Max),
	X0 #=< Max,
	X1 #=< Max,
	X2 #=< Max,
	X3 #=< Max,
	Y0 #=< Max,
	Y1 #=< Max,
	Y2 #=< Max,
	Y3 #=< Max
.
	

areVertexWellPositioned(rect(Rect,vertex(0,X0,Y0),vertex(0,X1,Y1),vertex(2,X2,Y2),vertex(3,X3,Y3), B, H), PositionedRects)	.
	






extract(ElementToExtract,[AnotherElement|RestOfTheElements], [AnotherElement|RestOfTheElementsMinusElementToExtract]):- extract(ElementToExtract,RestOfTheElements,RestOfTheElementsMinusElementToExtract).
extract(ElementToExtract,[ElementToExtract|RestOfTheElements], RestOfTheElements).



