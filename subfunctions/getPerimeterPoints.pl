%[getPerimeterPoints].
%getPerimeterPoints(rect(R,vertex(0,5,0),vertex(1,7,0),vertex(2,7,2),vertex(3,5,2), 2, 2)  ,  Result).
%getAllPerimetersPoints([rect(R,vertex(0,5,0),vertex(1,7,0),vertex(2,7,2),vertex(3,5,2), 2, 2)]  ,  Result).
%getAllPerimetersPoints([rect(R,vertex(0,5,0),vertex(1,7,0),vertex(2,7,2),vertex(3,5,2), 2, 2),rect(R2,vertex(0,5,0),vertex(1,8,0),vertex(2,8,2),vertex(3,5,2), 2, 2)]  ,  Result).
%getAllPerimetersPoints([rect(R,vertex(0,5,0),vertex(1,7,0),vertex(2,7,2),vertex(3,5,2), 2, 2),rect(R2,vertex(0,5,0),vertex(1,8,0),vertex(2,8,2),vertex(3,5,2), 3, 2),rect(R3,vertex(0,5,0),vertex(1,8,0),vertex(2,8,2),vertex(3,5,2), 3, 2)]  ,  Result).




getAllPerimetersPoints([],[]).
getAllPerimetersPoints(
			[rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H) | Rest],
			Result
			
):-	getPerimeterPoints(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)  ,  SubResult1),
	getAllPerimetersPoints(Rest,SubResult2),
	append(SubResult1, SubResult2, Result)
.
	




getPerimeterPoints(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)  ,  Result)
:- 	pointsBetweenTwoPoints(point(X0,Y0), point(X0,Y1), Result1), 
	pointsBetweenTwoPoints(point(X0,Y0), point(X1,Y0), Result2),
	pointsBetweenTwoPoints(point(X0,Y1), point(X1,Y1), Result3),
	pointsBetweenTwoPoints(point(X1,Y0), point(X1,Y1), Result4),
	append(Result1,Result2,Res1),
	append(Result3,Result4,Res2),
	append(Res1,Res2,Result)	
.
	


:-include('pointsBetweenTwoPoints.pl').


