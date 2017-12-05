%[validPositionings].
%validPositionings(rect(1,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), 1, 1), [rect(0,vertex(0,50,50),vertex(1,51,50),vertex(2,51,51),vertex(3,50,51), 1, 1)],Result).

:-include('rectPositionings.pl').
:-include('areaPoints.pl').
:-include('removeDuplicates.pl').


%True if ValidPositionings contains all the valid positionings of rect depending on already positioned rectangles
validPositionings(rect(R,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), B, H), PositionedRects, ValidPositionings):-
	%RectPositionings contains all the positionings (including those not valid) of rect depending on already positioned rectangles 
	rectPositionings(rect(R,vertex(0,_,_),vertex(1,_,_),vertex(2,_,_),vertex(3,_,_), B, H), PositionedRects, RectPositionings),
	%PositioningAreaPoints are computed once and for all	
	positioningAreaPoints(PositionedRects,PositioningAreaPoints),
	validPositioningsAux(RectPositionings, PositioningAreaPoints,PositionedRects,SubResult),
	removeDuplicates(SubResult,ValidPositionings,_)
.


%term1	contains "rect" with index R in every possible position
%term2 	contains all the area points of the already positioned rectangles
%term3	contains all the positioned rectangles
%term4	contains all the valid Postionings in the list at term1. ValidPositionings=[Positioning|_]=[[rect(...)|_]|_]
validPositioningsAux([], PositioningAreaPoints,PositionedRects,[]).
validPositioningsAux([rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)|TailRectPositionings], PositioningAreaPoints,PositionedRects,ValidPositionings)
:-
	%recursive call	
	validPositioningsAux(TailRectPositionings, PositioningAreaPoints,PositionedRects,TailRectValidPositionings),
	%RectAreaPoints are computed once and for all		
	rectAreaPoints(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)  ,  RectAreaPoints),
	%if rect is not well positioned ValidPositioningIncludingHeadRect is empty, else it contains the current positioning including rect 
	validPositioning(RectAreaPoints, PositioningAreaPoints, rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H),PositionedRects, ValidPositioningIncludingHeadRect),
	append(ValidPositioningIncludingHeadRect,TailRectValidPositionings, ValidPositionings)
.







%true if there is no overlapping, the last term contains the whole positioning of all the rects
validPositioning(RectAreaPoints, PositioningAreaPoints, rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H),PositionedRects,[[rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)|PositionedRects]]):-
	%true if PositioningAreaPoints-RectAreaPoints=PositioningAreaPoints
	%no overlapping
	subtract(PositioningAreaPoints, RectAreaPoints, PositioningAreaPoints).

%true if there is overlapping, the last term is empty
validPositioning(RectAreaPoints, PositioningAreaPoints, _,_,[]):-
	subtract(PositioningAreaPoints, RectAreaPoints, SubResult),
	length(PositioningAreaPoints, Length1),
	length(SubResult, Length2),
	Length1#\=Length2
.

