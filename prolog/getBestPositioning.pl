%[getBestPositioning].
%getBestPositioning(rect(0,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), 1, 1),[], Result).
%getBestPositioning(rect(1,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), 1, 1),[rect(0,vertex(0,1000,1000),vertex(1,1001,1000),vertex(2,1001,1001),vertex(3,1000,1001),1,1)], Result).


:-include('getValidPositionings.pl').
:-include('getPerimeterPoints.pl').


getBestPositioning(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H),Positioned, Result)
:-
	getValidPositionings(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H), Positioned, ValidPositionings),
	getBestPositioningAux(ValidPositionings, Score, Result)
.


getBestPositioningAux([],0,[]).
getBestPositioningAux([Positioning|Tail], Score1, Positioning)
:-
	getScore(Positioning, Score1),
	getBestPositioningAux(Tail, Score2, SubResult),
	Score1#>=Score2
.
getBestPositioningAux([Positioning|Tail], Score2, SubResult)
:-
	getScore(Positioning, Score1),
	getBestPositioningAux(Tail, Score2, SubResult),
	Score2#>Score1
.


	
