:-include('removeDuplicates.pl').
:-include('perimeterPoints.pl').

%Score = number of matching perimeter's points between positioned rects
score(Positioning, Score)
:-
	%PositioningPerimeterPoints=list of all positioned rects perimeter's points (with duplicates)
	positioningPerimeterPoints(Positioning,PositioningPerimeterPoints),
	%Score= number of duplicate elements in PositioningPerimeterPoints list
	removeDuplicates(PositioningPerimeterPoints,_,Score)
.
