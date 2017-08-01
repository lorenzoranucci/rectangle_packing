%[getAreaPoints].
%getAreaPoints(rect(5,vertex(0,0,0),vertex(1,2,0),vertex(2,2,2),vertex(3,0,2), 2, 2)  ,  Result).
%getAreaPoints(rect(5,vertex(0,0,0),vertex(1,3,0),vertex(2,3,3),vertex(3,0,3), 3, 3)  ,  Result).
%getAreaPoints(rect(5,vertex(0,0,1),vertex(1,3,1),vertex(2,3,3),vertex(3,0,3), 3, 2)  ,  Result).

%getAllAreaPoints([rect(5,vertex(0,0,1),vertex(1,3,1),vertex(2,3,3),vertex(3,0,3), 3, 2), rect(6,vertex(0,5,5),vertex(1,7,5),vertex(2,7,7),vertex(3,5,7), 2, 2)]  ,  Result).

:-include('pointsBetweenTwoPoints.pl').


%Get all input list's rects area's points 
getAllAreaPoints([],[]).
getAllAreaPoints([rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)|Tail],Result)
:-
	getAreaPoints(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)  ,  SubResult1),
	getAllAreaPoints(Tail,SubResult2), 
	append(SubResult1,SubResult2,Result)
.


%Get single rect area's points list
getAreaPoints(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)  ,  []):-Y0#>=Y1.
getAreaPoints(rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)  ,  Result)
:-	
	NEWX1#=X1-1,
	NEWY0#=Y0+1,
	Y0#<Y1,
	pointsBetweenTwoPoints(point(X0,Y0), point(NEWX1,Y0), SubResult1),
	getAreaPoints(rect(R,vertex(0,X0,NEWY0),vertex(1,X1,NEWY0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)  ,  SubResult2), 
	append(SubResult1,SubResult2,Result)
.
	
	



