%[areaPoints].
%rectAreaPoints(rect(5,vertex(0,0,0),vertex(1,2,0),vertex(2,2,2),vertex(3,0,2), 2, 2)  ,  Result).
%rectAreaPoints(rect(5,vertex(0,0,0),vertex(1,3,0),vertex(2,3,3),vertex(3,0,3), 3, 3)  ,  Result).
%rectAreaPoints(rect(5,vertex(0,0,1),vertex(1,3,1),vertex(2,3,3),vertex(3,0,3), 3, 2)  ,  Result).

%positioningAreaPoints([rect(5,vertex(0,0,1),vertex(1,3,1),vertex(2,3,3),vertex(3,0,3), 3, 2), rect(6,vertex(0,5,5),vertex(1,7,5),vertex(2,7,7),vertex(3,5,7), 2, 2)]  ,  Result).

:-include('pointsBetweenTwoPoints.pl').


%Get all input list's rects area's points 
positioningAreaPoints([],[]).
positioningAreaPoints([rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)|Tail],PositioningAreaPoints)
:-
	
	positioningAreaPoints(Tail,TailAreaPoints), 
	rectAreaPoints(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)  ,  HeadRectAreaPoints),
	append(HeadRectAreaPoints,TailAreaPoints,PositioningAreaPoints)
.


%Get single rect area's points list
rectAreaPoints(rect(_,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), _, _)  ,  []):-Y0#>=Y1.
rectAreaPoints(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)  ,  RectAreaPoints)
:-	
	NEWX1#=X1-1,
	NEWY0#=Y0+1,
	Y0#<Y1,
	pointsBetweenTwoPoints(point(X0,Y0), point(NEWX1,Y0), SubResult1),
	rectAreaPoints(rect(R,vertex(0,X0,NEWY0),vertex(1,X1,NEWY0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)  ,  SubResult2), 
	append(SubResult1,SubResult2,RectAreaPoints)
.
	
	



