%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%GENERAL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
position(vertex(0,square(0)),coord(CENTER,CENTER)):- center(CENTER), square(0). 
%position(vertex(0,triangle(0)),coord(CENTER,CENTER)):- center(CENTER), triangle(0). 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%SQUARE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


square_vertex_idxs(0..3).
vertex(VERTEX_IDX, square(SQUARE_IDX) ):- square(SQUARE_IDX), square_vertex_idxs(VERTEX_IDX).

1{
	position(vertex(VERTEX_IDX,square(I)), coord(X+UNIT, Y)), 
	position(vertex(VERTEX_IDX,square(I)), coord(X-UNIT, Y)), 
	position(vertex(VERTEX_IDX,square(I)), coord(X, Y+UNIT)), 
	position(vertex(VERTEX_IDX,square(I)), coord(X, Y-UNIT))
}1:-position(vertex(VERTEX_IDX-1,square(I)), coord(X, Y)),
vertex(VERTEX_IDX,square(I)), unit(UNIT), coord(X,Y),  square_vertex_idxs(VERTEX_IDX), square(I).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Triangle%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%INPUT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
square(0).
center(10/2).
coord(0..10,0..10).
unit(2).
