big_triangle(1).
medium_triangle(3;4).
small_triangle(5).
square(6).
parallelepiped(7).
range(0..8).

square_vertex_idxs(0..3).
triangle_vertex_idxs(0..2).


1{position(T_IDX, 0, X, Y): range(X;Y)}1:-big_triangle(T_IDX).


position(T_IDX, 1, X1, Y1):-
	range(X0;Y0; X1;Y1),
	big_triangle(T_IDX),
	position(T_IDX, 0, X0, Y0),
	plus(times(minus(X1,X0),minus(X1,X0)) , times(minus(Y1,Y0),minus(Y1,Y0)))==64, 					% bigger edge=8 (quadratic euclidean distance=64)
	not position_elsewhere(T_IDX, 1, X1, Y1)
	.

position(T_IDX, 2, X2, Y2):-
	range(X0;Y0; X1;Y1;X2;Y2),
	big_triangle(T_IDX),
	position(T_IDX, 0, X0, Y0),
	position(T_IDX, 0, X1, Y1),
	(X2-X0)*(X2-X0) + (Y2-Y0)*(Y2-Y0)==32,
	(X2-X1)*(X2-X1) + (Y2-Y1)*(Y2-Y1)==32,		
	not position_elsewhere(T_IDX, 2, X2, Y2)
.

positioned_big_triangle(T_IDX):-
	big_triangle(T_IDX),
	range(X0;Y0; X1;Y1;X2;Y2),
	position(T_IDX, 0, X0, Y0),
	position(T_IDX, 1, X1, Y1),
	position(T_IDX, 2, X2, Y2)
.

position_elsewhere(T_IDX,V,X,Y):-
	big_triangle(T_IDX), range(X;Y;X1;Y1),triangle_vertex_idxs(V),
	position(T_IDX, V , X1, Y1),
	X!=X1.

position_elsewhere(T_IDX,V,X,Y):-
	big_triangle(T_IDX), range(X;Y;X1;Y1),triangle_vertex_idxs(V),
	position(T_IDX, V , X1, Y1),
	Y!=Y1.

:- not positioned_big_triangle(T_IDX),  big_triangle(T_IDX).





#hide position_elsewhere(T_IDX,V,X,Y).















