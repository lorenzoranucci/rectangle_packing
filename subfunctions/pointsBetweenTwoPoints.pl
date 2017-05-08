%[pointsBetweenTwoPoints].    
%pointsBetweenTwoPoints(point(10,13), point(15,13), Result).
%pointsBetweenTwoPoints(point(10,13), point(10,16), Result).



pointsBetweenTwoPoints(point(X0,Y0), point(X0,Y0), [point(X0,Y0)|[]]).

pointsBetweenTwoPoints(point(X0,Y0), point(X1,Y0), [point(X0,Y0)|Result]):-	
	X0#<X1,	
	NEW_X0 #= X0+1,
	pointsBetweenTwoPoints(point(NEW_X0,Y0), point(X1,Y0), Result)
.


pointsBetweenTwoPoints(point(X0,Y0), point(X0,Y1), [point(X0,Y0)|Result]):-	
	Y0#<Y1,	
	NEW_Y0 #= Y0+1,
	pointsBetweenTwoPoints(point(X0,NEW_Y0), point(X0,Y1), Result)
.



