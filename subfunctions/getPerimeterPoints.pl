%[getPerimeterPoints].
%getPerimeterPoints(rect(R,vertex(0,5,0),vertex(1,7,0),vertex(2,7,2),vertex(3,5,2), 2, 2)  ,  Result).







getPerimeterPoints(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)  ,  
			[	Result1,
				Result2,
				Result3,
				Result4
			])
:- 	pointsBetweenTwoPoints(point(X0,Y0), point(X0,Y1), Result1), 
	pointsBetweenTwoPoints(point(X0,Y0), point(X1,Y0), Result2),
	pointsBetweenTwoPoints(point(X0,Y1), point(X1,Y1), Result3),
	pointsBetweenTwoPoints(point(X1,Y0), point(X1,Y1), Result4).
	


pointsBetweenTwoPoints(point(X0,Y0), point(X0,Y0), [point(X0,Y0)|Result]).

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


