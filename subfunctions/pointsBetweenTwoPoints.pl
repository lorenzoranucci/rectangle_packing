%[pointsBetweenTwoPoints].    
%pointsBetweenTwoPoints(point(10,13), point(15,13), Result).
	%Result = [point(10,13),point(11,13),point(12,13),point(13,13),point(14,13),point(15,13)]
%pointsBetweenTwoPoints(point(15,13), point(10,13), Result).
	%Result = [point(10,13),point(11,13),point(12,13),point(13,13),point(14,13),point(15,13)]
%pointsBetweenTwoPoints(point(10,13), point(10,16), Result).
	%Result = [point(10,13),point(10,14),point(10,15),point(10,16)]
%pointsBetweenTwoPoints(point(10,16), point(10,13), Result).
	%Result = [point(10,13),point(10,14),point(10,15),point(10,16)]


%Get all segment's points
pointsBetweenTwoPoints(point(X0,Y0), point(X0,Y0), [point(X0,Y0)|[]]).

pointsBetweenTwoPoints(point(X0,Y0), point(X1,Y0), [point(X0,Y0)|Result]):-	
	X0#<X1,	
	NEW_X0 #= X0+1,
	pointsBetweenTwoPoints(point(NEW_X0,Y0), point(X1,Y0), Result)
.

pointsBetweenTwoPoints(point(X0,Y0), point(X1,Y0), [point(X1,Y0)|Result]):-	
	X0#>X1,	
	NEW_X1 #= X1+1,
	pointsBetweenTwoPoints(point(X0,Y0), point(NEW_X1,Y0), Result)
.


pointsBetweenTwoPoints(point(X0,Y0), point(X0,Y1), [point(X0,Y0)|Result]):-	
	Y0#<Y1,	
	NEW_Y0 #= Y0+1,
	pointsBetweenTwoPoints(point(X0,NEW_Y0), point(X0,Y1), Result)
.


pointsBetweenTwoPoints(point(X0,Y0), point(X0,Y1), [point(X0,Y1)|Result]):-	
	Y0#>Y1,	
	NEW_Y1 #= Y1+1,
	pointsBetweenTwoPoints(point(X0,Y0), point(X0,NEW_Y1), Result)
.


