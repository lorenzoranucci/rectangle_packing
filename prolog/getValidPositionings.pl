%[getValidPositionings].
%getValidPositionings(rect(1,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1), [rect(0,vertex(0,50,50),vertex(1,51,50),vertex(2,51,51),vertex(3,50,51), 1, 1)],Result).

:-include('locateRectInPerimeterPoints.pl').
:-include('getPositionigIfValid.pl').
:-include('getAreaPoints.pl').
:-include('removeDuplicates.pl').


getValidPositionings(rect(R,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), B, H), PositionedRects,Result):-
	getAllAreaPoints(PositionedRects,PositionedAreaPoints),
	locateRectInPerimeterPoints(rect(R,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), B, H), PositionedRects, CurrentRectPositionings),
	getValidPositioningsAux(CurrentRectPositionings, PositionedAreaPoints,PositionedRects,SubResult),
	removeDuplicates(SubResult,Result,_)
.


getValidPositioningsAux([], PositionedAreaPoints,PositionedRects,[]).
getValidPositioningsAux([rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)|Positionings], PositionedAreaPoints,PositionedRects,Result)
:-
	getAreaPoints(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)  ,  SubResult1),
	getPositionigIfValid(SubResult1, PositionedAreaPoints, rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H),PositionedRects,SubResult2),
	getValidPositioningsAux(Positionings, PositionedAreaPoints,PositionedRects,SubResult3),
	append(SubResult2,SubResult3,Result)
.



