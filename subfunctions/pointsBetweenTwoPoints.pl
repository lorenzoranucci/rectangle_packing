%[pointsBetweenTwoPoints].    
%pointsBetweenTwoPoints(point(10,13), point(15,13), Result).

pointsBetweenTwoPoints(point(X0,Y0), point(X0,Y0), [point(X0,Y0)|Result]).

pointsBetweenTwoPoints(point(X0,Y0), point(X1,Y0), [point(X0,Y0)|Result]):-	
	X0#<X1,	
	NEW_X0 #= X0+1,
	pointsBetweenTwoPoints(point(NEW_X0,Y0), point(X1,Y0), Result)
.


