big_triangle(1;2).
medium_triangle(3;4).
small_triangle(5).
square(6).
parallelepiped(7).
range(0..8).


1{position(T_IDX, 0, X, Y): range(X;Y)}1:-big_triangle(T_IDX).
1{position(T_IDX, 0, X, Y): range(X;Y)}1:-medium_triangle(T_IDX).
1{position(T_IDX, 0, X, Y): range(X;Y)}1:-small_triangle(T_IDX).
1{position(S_IDX, 0, X, Y): range(X;Y)}1:-square(S_IDX).
1{position(P_IDX, 0, X, Y): range(X;Y)}1:-parallelepiped(P_IDX).

1{position(T_IDX, 1, X, Y): range(X;Y)}1:-big_triangle(T_IDX).
1{position(T_IDX, 1, X, Y): range(X;Y)}1:-medium_triangle(T_IDX).
1{position(T_IDX, 1, X, Y): range(X;Y)}1:-small_triangle(T_IDX).
1{position(S_IDX, 1, X, Y): range(X;Y)}1:-square(S_IDX).
1{position(P_IDX, 1, X, Y): range(X;Y)}1:-parallelepiped(P_IDX).

1{position(T_IDX, 2, X, Y): range(X;Y)}1:-big_triangle(T_IDX).
1{position(T_IDX, 2, X, Y): range(X;Y)}1:-medium_triangle(T_IDX).
1{position(T_IDX, 2, X, Y): range(X;Y)}1:-small_triangle(T_IDX).
1{position(S_IDX, 2, X, Y): range(X;Y)}1:-square(S_IDX).
1{position(P_IDX, 2, X, Y): range(X;Y)}1:-parallelepiped(P_IDX).

1{position(S_IDX, 3, X, Y): range(X;Y)}1:-square(S_IDX).
1{position(P_IDX, 3, X, Y): range(X;Y)}1:-parallelepiped(P_IDX).
	

well_positioned(T_IDX):-
	big_triangle(T_IDX), range(X0;X1;X2;Xm;Y0;Y1;Y2;Ym),
	position(T_IDX, 0, X0, Y0),
	position(T_IDX, 1, X1, Y1),
	position(T_IDX, 2, X2, Y2),
	(X1-X0)*(X1-X0) + (Y1-Y0)*(Y1-Y0)==64, 					% bigger edge=8 (quadratic euclidean distance=64)
	Xm= (X1+X0)/2, Ym=(Y1+Y0)/2, (X2-Xm)*(X2-Xm) + (Y2-Ym)*(Y2-Ym)==16,	% height=4 (quadratic euclidean distance=16)
	(Ym-Y2)/(Xm-X2)==-((X1-X0)/(Y1-Y0))					% base perpendicular to height
.


well_positioned(T_IDX):-
	medium_triangle(T_IDX), range(X0;X1;X2;Y0;Y1;Y2), 
	position(T_IDX, 0, X0, Y0),
	position(T_IDX, 1, X1, Y1),
	position(T_IDX, 2, X2, Y2),
	(X1-X0)*(X1-X0) + (Y1-Y0)*(Y1-Y0)==16, 					% cateto1=4 (quadratic euclidean distance=16)
	(X2-X1)*(X2-X1) + (Y2-Y1)*(Y2-Y1)==16, 					% cateto2=4 (quadratic euclidean distance=16)
	(Y0-Y1)/(X0-X1)==-((X1-X2)/(Y1-Y2))					% cateto1 perpendicular to cateto2
.


well_positioned(T_IDX):-
	small_triangle(T_IDX), range(X0;X1;X2;Xm;Y0;Y1;Y2;Ym),
	position(T_IDX, 0, X0, Y0),
	position(T_IDX, 1, X1, Y1),
	position(T_IDX, 2, X2, Y2),
	(X1-X0)*(X1-X0) + (Y1-Y0)*(Y1-Y0)==16, 					% bigger edge=4 (quadratic euclidean distance=16)
	Xm= (X1+X0)/2, Ym=(Y1+Y0)/2, (X2-Xm)*(X2-Xm) + (Y2-Ym)*(Y2-Ym)==4,	% height=2 (quadratic euclidean distance=4)
	(Ym-Y2)/(Xm-X2)==-((X1-X0)/(Y1-Y0))					% base perpendicular to height
.

well_positioned(S_IDX):-
	square(S_IDX), range(X0;X1;X2;X3;Y0;Y1;Y2;Y3),
	position(S_IDX, 0, X0, Y0),
	position(S_IDX, 1, X1, Y1),
	position(S_IDX, 2, X2, Y2),
	position(S_IDX, 3, X3, Y3),
	(X2-X0)*(X2-X0) + (Y2-Y0)*(Y2-Y0)==16, 					% diagonal1=4 (quadratic euclidean distance=16)
	(X1-X3)*(X1-X3) + (Y1-Y3)*(Y1-Y3)==16, 					% diagonal2=4 (quadratic euclidean distance=16)
	(Y2-Y0)/(X2-X0)==-((X1-X3)/(Y1-Y3))					% diagonal1 perpendicular to diagonal2
.

well_positioned(P_IDX):-
	parallelepiped(P_IDX),  range(X0;X1;X2;X3;Y0;Y1;Y2;Y3),
	position(P_IDX, 0, X0, Y1),
	position(P_IDX, 1, X1, Y1),
	position(P_IDX, 2, X2, Y2),
	position(P_IDX, 3, X3, Y3),
	(X1-X0)*(X1-X0) + (Y1-Y0)*(Y1-Y0)==16, 					% edge1=4 (quadratic euclidean distance=16)
	(X2-X3)*(X2-X3) + (Y2-Y3)*(Y2-Y3)==16, 					% edge3=4 (quadratic euclidean distance=16)
	(X2-X1)*(X2-X1) + (Y2-Y1)*(Y2-Y1)==13, 					% edge2=3,605551275 (quadratic euclidean distance=13)
	(Y1-Y0)/(X1-X0)==(Y2-Y3)/(X2-X3),					% edge1 parallel to edge2
	(Y1-Y2)/(X1-X2)==(Y0-Y3)/(X0-X3)						% edge2 parallel to edge3
.



:- big_triangle(T_IDX), not well_positioned(T_IDX).
:- medium_triangle(T_IDX), not well_positioned(T_IDX).
:- small_triangle(T_IDX), not well_positioned(T_IDX).
:- square(S_IDX), not well_positioned(S_IDX).
:- parallelepiped(P_IDX), not well_positioned(P_IDX).
















