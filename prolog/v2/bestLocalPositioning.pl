%[bestLocalPositioning].
%bestLocalPositioning(rect(0,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), 1, 1),[], Result).
%bestLocalPositioning(rect(1,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), 1, 1),[rect(0,vertex(0,1000,1000),vertex(1,1001,1000),vertex(2,1001,1001),vertex(3,1000,1001),1,1)], Result).


:-include('validPositionings.pl').
:-include('score.pl').



%It's true only if BestLocalPositioning is the best positioning (with highest score) among all ValidPositionings of "rect" depending on already Positioned rectangles
%	rect		rectangle to locate
%	Positioned	list of already placed rectangles 
%	Result		list of placed rectangles (including "rect" placed in the local, greedy, best way)
bestLocalPositioning(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H),Positioned, BestLocalPositioning)
:-
	%locate the current rectangle in every possible way depending on already positioned rectangles
	validPositionings(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H), Positioned, ValidPositionings),
	%the best local positioning is one of the valid positionings, the one with the highest score	
	bestLocalPositioningAux(ValidPositionings, _ , BestLocalPositioning)
.

%Extract positioning with max score from the list of valid positionings
%	1				list of rectangles to be placed
%	ScoreBestLocalPositioning	best local positioning score
%	BestLocalPositioning 		best local positioning

%Base case: the best positioning between no positioning is nothing
bestLocalPositioningAux([],0,[]).
%The positioning in the head has the highest score ( higher than the score of the other positioning in the tail list computed in the recursive calls)
bestLocalPositioningAux([BestLocalPositioning|TailPositionings], ScoreBestLocalPositioning, BestLocalPositioning)
:-
	%recursive call, ScoreTailPositioning is the best score in the tail list
	bestLocalPositioningAux(TailPositionings, ScoreTailPositioning, _),
	%head positioning score
	score(BestLocalPositioning, ScoreBestLocalPositioning),
	%it's true if head positioning score is more than recursive calls score
	ScoreBestLocalPositioning#>=ScoreTailPositioning
.
%The positioning in the head has a lower score than at least one of the other positioning in the tail list computed in the recursive calls
bestLocalPositioningAux([HeadPositioning|TailPositionings], ScoreBestLocalPositioning, BestLocalPositioning)
:-
	%recursive call, ScoreBestLocalPositioning is the best score in the tail list
	bestLocalPositioningAux(TailPositionings, ScoreBestLocalPositioning, BestLocalPositioning),
	%head positioning score
	score(HeadPositioning, ScoreHeadPositioning),	
	%it's true if recursive calls score is more than head positioning score
	ScoreBestLocalPositioning#>ScoreHeadPositioning
.


	
