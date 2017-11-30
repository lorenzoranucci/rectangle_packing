%[getBestPositioning].
%getBestPositioning(rect(0,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), 1, 1),[], Result).
%getBestPositioning(rect(1,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), 1, 1),[rect(0,vertex(0,1000,1000),vertex(1,1001,1000),vertex(2,1001,1001),vertex(3,1000,1001),1,1)], Result).


:-include('getValidPositionings.pl').
:-include('getPerimeterPoints.pl').



%It's true only if Result is the best positioning among all ValidPositioning of "rect" depending on already Positioned rectangles
%	rect		rectangle to locate
%	Positioned	list of rectangles already located
%	Result		list of located rectangles (including "rect" positioned in the best way)
getBestPositioning(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H),Positioned, Result)
:-
	%locate the current rectangle in every possible way depending on already positioned rectangles
	getValidPositionings(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H), Positioned, ValidPositionings),
	getBestPositioningAux(ValidPositionings, Score, Result)
.


%Extract positioning with max score from the list of positionings
%	1		list of rectangles positionings
%	Score		best positioning score
%	Positioning 	best positioning

%Base case, score is 0 if the list of rectangles positionings is empty
getBestPositioningAux([],0,[]).
%It's true if the head rectangles Positioning has a Score (Score1) HIGHER than the max score in the recursive calls (Score2) 
getBestPositioningAux([Positioning|Tail], Score1, Positioning)
:-
	%head positioning score
	getScore(Positioning, Score1),
	%recursive call, score2 is the best score in the sublist
	getBestPositioningAux(Tail, Score2, SubResult),
	%it's true if head positioning score is more than recursive calls score
	Score1#>=Score2
.
%It's true if the head rectangles Positioning has a Score (Score1) LOWER than the max score in the recursive calls (Score2) 
getBestPositioningAux([Positioning|Tail], Score2, SubResult)
:-
	%head positioning score
	getScore(Positioning, Score1),
	%recursive call, score2 is the best score in the sublist
	getBestPositioningAux(Tail, Score2, SubResult),
	%it's true if recursive calls score is more than head positioning score
	Score2#>Score1
.


	
