%[solution].
%solution([rect(0,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1), rect(1,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1)],Result).
%solution([rect(0,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 2, 2), rect(1,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1), rect(2,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1)],Result).
%solution([rect(0,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 2, 2), rect(1,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1), rect(2,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1), rect(3,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1)],Result).

%solution([rect(0,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 2, 2), rect(1,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1), rect(2,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1), rect(3,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1), rect(4,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1)],Result).




%solution([rect(0,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 2, 1), rect(1,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 3, 1)],Result).
%solution([rect(0,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1), rect(1,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 3, 1)],Result).

:- use_module(library(clpfd)).
:-include('getBestPositioning.pl').




solution(Rect,Result):-solutionAux(Rect,[],Result).
solutionAux([], PositionedRects,PositionedRects).
solutionAux([rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)|Positionings], PositionedRects,Result)
:-
	getBestPositioning(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H),PositionedRects,SubResult1),
	solutionAux(Positionings, SubResult1,Result)
.



