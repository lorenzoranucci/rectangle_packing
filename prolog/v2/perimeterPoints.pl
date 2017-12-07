%[perimeterPoints].
%rectPerimeterPoints(rect(R,vertex(0,5,0),vertex(1,7,0),vertex(2,7,2),vertex(3,5,2), 2, 2)  ,  Result).
%positioningPerimeterPoints([rect(R,vertex(0,5,0),vertex(1,7,0),vertex(2,7,2),vertex(3,5,2), 2, 2)]  ,  Result).
%positioningPerimeterPoints([rect(R,vertex(0,5,0),vertex(1,7,0),vertex(2,7,2),vertex(3,5,2), 2, 2),rect(R2,vertex(0,5,0),vertex(1,8,0),vertex(2,8,2),vertex(3,5,2), 2, 2)]  ,  Result).
%positioningPerimeterPoints([rect(R,vertex(0,5,0),vertex(1,7,0),vertex(2,7,2),vertex(3,5,2), 2, 2),rect(R2,vertex(0,5,0),vertex(1,8,0),vertex(2,8,2),vertex(3,5,2), 3, 2),rect(R3,vertex(0,5,0),vertex(1,8,0),vertex(2,8,2),vertex(3,5,2), 3, 2)]  ,  Result).

:-include('removeDuplicates.pl').
:-include('pointsBetweenTwoPoints.pl').

%True if PositioningPerimeterPoints contains all the perimeter points (with duplicates) of the Postioning in the first term
%Base case: a positioning with no rectangles has no perimeter points
positioningPerimeterPoints([],[]).
%True if contains all the perimeter points of the rectangle in the head and the rectangles in the tail
positioningPerimeterPoints( [rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H) | Tail]   ,  PositioningPerimeterPoints ):-	
	
	positioningPerimeterPoints(Tail,TailPerimeterPoints),
	rectPerimeterPoints(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)  ,  RectPerimeterPoints),
	append(RectPerimeterPoints, TailPerimeterPoints, PositioningPerimeterPoints)
.
	



%True if RectPerimeterPoints contains all the points of every rectangle's edge
rectPerimeterPoints(rect(_,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), _, _)  ,  RectPerimeterPoints)
:- 	pointsBetweenTwoPoints(point(X0,Y0), point(X0,Y1), Result1), 
	pointsBetweenTwoPoints(point(X0,Y0), point(X1,Y0), Result2),
	pointsBetweenTwoPoints(point(X0,Y1), point(X1,Y1), Result3),
	pointsBetweenTwoPoints(point(X1,Y0), point(X1,Y1), Result4),
	append(Result1,Result2,Res1),
	append(Result3,Result4,Res2),
	append(Res1,Res2,Res3),
	removeDuplicates(Res3,RectPerimeterPoints,_)	
.
	




