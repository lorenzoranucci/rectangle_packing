%[solution].
%solution([rect(0,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1), rect(1,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1)],Result).
%solution([rect(0,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 2, 2), rect(1,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1), rect(2,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1)],Result).
%solution([rect(0,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 2, 2), rect(1,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1), rect(2,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1), rect(3,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1)],Result).

%solution([rect(0,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 2, 2), rect(1,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1), rect(2,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1), rect(3,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1), rect(4,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1)],Result).




%solution([rect(0,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 2, 1), rect(1,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 3, 1)],Result).
%solution([rect(0,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1), rect(1,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 3, 1)],Result).

:- use_module(library(clpfd)).
:-include('getBestPositioning.pl').



%Given a list of rectangles returns the same list with rectangles coordinates
%	Rect	list of rect to locate (with variable coordinates)
%	Result	list of located rectangles
solution(Rect,Result):-solutionAux(Rect,[],Result).


%Given a list of rectangles and a list of already positioned rectangles returns the previous list of positioned rectangles improved with the head of first list
%	1			list of rectangles to locate (with variable coordinates)
%	PositionedRects		list of rectangles already located
%	Result			list of located rectangles
solutionAux([], PositionedRects,PositionedRects).
solutionAux([rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)|Positionings], PositionedRects,Result)
:-
	%greedily choice the best head rect position depending on already positioned rectangles
	getBestPositioning(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H),PositionedRects,SubResult1),
	%remove head from the list of rectangles to locate and add it (with coordinates) to positioned rects	
	solutionAux(Positionings, SubResult1,Result)
.



