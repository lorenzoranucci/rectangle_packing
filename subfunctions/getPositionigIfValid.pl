

getPositionigIfValid(RectAreaPoints, AllAreaPoints, rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H),PositionedRects,[[rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)|PositionedRects]]):-
	subtract(AllAreaPoints, RectAreaPoints, AllAreaPoints).

getPositionigIfValid(RectAreaPoints, AllAreaPoints, rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H),PositionedRects,[]):-
	subtract(AllAreaPoints, RectAreaPoints, SubResult),
	length(AllAreaPoints, Length1),
	length(SubResult, Length2),
	Length1#\=Length2
.
