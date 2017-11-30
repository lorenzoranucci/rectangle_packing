:-include('removeDuplicates.pl').

%Score = number of matching perimeter's points between positioned rects
getScore(Positioning, Score)
:-
	%SubResult=list of all positioned rects perimeter's points (with duplicates)
	getAllPerimetersPoints(Positioning,SubResult),
	%Result= number of duplicate elements in SubResult list
	removeDuplicates(SubResult,_,Score)
.
