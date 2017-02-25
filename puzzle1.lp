%%quadrato 


square_vertex_idxs(0..3).
vertex(VERTEX_IDX, square(SQUARE_IDX) ):- square(SQUARE_IDX), square_vertex_idxs(VERTEX_IDX).

%place first vertex everywhere
1{position(vertex(0,SQUARE),coord(X,Y)) : coord(X,Y)}1:- vertex(0,SQUARE).

1{
	position(vertex(1,SQUARE), coord(X+UNIT, Y)), 
	position(vertex(1,SQUARE), coord(X-UNIT, Y)), 
	position(vertex(1,SQUARE), coord(X, Y+UNIT)), 
	position(vertex(1,SQUARE), coord(X, Y+UNIT))
}1:-vertex(1,SQUARE), unit(UNIT), coord(X,Y), position(vertex(0,SQUARE), coord(X, Y)).





















%input
square(0).
range(0..4).
coord(X,Y):-range(X), range(Y).
unit(2).
