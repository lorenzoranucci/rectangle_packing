%[checkRectOverlapping].
%checkRectOverlapping([point(15,5),point(16,5)], [point(0,1),point(1,1),point(2,1),point(0,2),point(1,2),point(2,2),point(5,5),point(6,5),point(5,6),point(6,6)], rect(6,vertex(0,5,5),vertex(1,7,5),vertex(2,7,7),vertex(3,5,7), 2, 2), Result).
%checkRectOverlapping([point(5,5),point(6,5)], [point(0,1),point(1,1),point(2,1),point(0,2),point(1,2),point(2,2),point(5,5),point(6,5),point(5,6),point(6,6)], rect(6,vertex(0,5,5),vertex(1,7,5),vertex(2,7,7),vertex(3,5,7), 2, 2), Result).

checkRectOverlapping(Tail0, Tail1, rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H),[rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)]):-
	subtract(Tail1, Tail0, Tail1).

checkRectOverlapping(Tail0, Tail1, rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H),[]):-
	subtract(Tail1, Tail0, Tail2),
	length(Tail1, Length1),
	length(Tail2, Length2),
	Length1#\=Length2
.
