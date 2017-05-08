%[getPerimeterPoints].
%getPerimeterPoints(rect(R,vertex(0,5,0),vertex(1,7,0),vertex(2,7,2),vertex(3,5,2), 2, 2)  ,  Result).
%getAllPerimetersPoints([rect(R,vertex(0,5,0),vertex(1,7,0),vertex(2,7,2),vertex(3,5,2), 2, 2)]  ,  Result).
%getAllPerimetersPoints([rect(R,vertex(0,5,0),vertex(1,7,0),vertex(2,7,2),vertex(3,5,2), 2, 2),rect(R,vertex(0,5,0),vertex(1,8,0),vertex(2,8,2),vertex(3,5,2), 2, 2)]  ,  Result).



getAllPerimetersPoints([],[]).
getAllPerimetersPoints(
			[rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H) | Rest],
			[Result|SubResult]
			
):-	getPerimeterPoints(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)  ,  Result),
	getAllPerimetersPoints(Rest,SubResult)
	
.
	




getPerimeterPoints(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)  ,  Result)
:- 	pointsBetweenTwoPoints(point(X0,Y0), point(X0,Y1), Result1), 
	pointsBetweenTwoPoints(point(X0,Y0), point(X1,Y0), Result2),
	pointsBetweenTwoPoints(point(X0,Y1), point(X1,Y1), Result3),
	pointsBetweenTwoPoints(point(X1,Y0), point(X1,Y1), Result4),
	concat(Result1,Result2,Res1),
	concat(Result3,Result4,Res2),
	concat(Res1,Res2,Result)	
.
	


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

concat([],[],[]).

concat([],[X2|L2], [X2|Result]):- concat([],L2,Result).
concat([X1|L1],[X2|L2], [X1|Result]):- concat(L1,[X2|L2],Result).
