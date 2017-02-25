%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%GENERAL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
position(vertex(0,square(0)),coord(CENTER,CENTER)):- center(CENTER), square(0). 
%position(vertex(0,triangle(0)),coord(CENTER,CENTER)):- center(CENTER), triangle(0). 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%SQUARE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


square_vertex_idxs(0..3).
%%%%init square vertices
vertex(VERTEX_IDX, square(SQUARE_IDX) ):- square(SQUARE_IDX), square_vertex_idxs(VERTEX_IDX).

%%%%position square vertices everywhere%%%%
position(vertex(VERTEX_IDX,square(I)), coord(X+UNIT, Y)):-
	position(vertex(VERTEX_IDX-1,square(I)), coord(X, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X-UNIT, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X, Y+UNIT)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X, Y-UNIT)),
	square_vertex_idxs(VERTEX_IDX), square(I), vertex(VERTEX_IDX,square(I)), coord(X, Y), unit(UNIT), coord(X+UNIT, Y)
.

position(vertex(VERTEX_IDX,square(I)), coord(X-UNIT, Y)):-
	position(vertex(VERTEX_IDX-1,square(I)), coord(X, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X+UNIT, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X, Y+UNIT)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X, Y-UNIT)),
	square_vertex_idxs(VERTEX_IDX), square(I), vertex(VERTEX_IDX,square(I)), coord(X, Y), unit(UNIT), coord(X-UNIT, Y)
.

position(vertex(VERTEX_IDX,square(I)), coord(X, Y+UNIT)):-
	position(vertex(VERTEX_IDX-1,square(I)), coord(X, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X+UNIT, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X-UNIT, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X, Y-UNIT)),
	square_vertex_idxs(VERTEX_IDX), square(I), vertex(VERTEX_IDX,square(I)), coord(X, Y), unit(UNIT), coord(X, Y+UNIT)
	
.

position(vertex(VERTEX_IDX,square(I)), coord(X, Y-UNIT)):-
	position(vertex(VERTEX_IDX-1,square(I)), coord(X, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X+UNIT, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X-UNIT, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X, Y+UNIT)),
	square_vertex_idxs(VERTEX_IDX), square(I), vertex(VERTEX_IDX,square(I)), coord(X, Y), unit(UNIT), coord(X, Y-UNIT)
.
%%%%END position square vertices everywhere%%%%%

%%%%first vertex and last vertex must have distance == UNIT
:-position(vertex(0,square(I)), coord(X0, Y0)),position(vertex(3,square(I)), coord(X3, Y3)), not eq(abs(X3-X0)+abs(Y3-Y0), UNIT),
	square(I), coord(X0, Y0), coord(X3, Y3), unit(UNIT).

%%%%vertices can not be in the same position each other
:-position(vertex(VERTEX_IDX1,square(I)), coord(X, Y)), position(vertex(VERTEX_IDX2,square(I)), coord(X, Y)), VERTEX_IDX1!=VERTEX_IDX2, square_vertex_idxs(VERTEX_IDX1;VERTEX_IDX2), square(I), coord(X,Y).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Triangle%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%INPUT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
square(0).
center(20/2).
coord(0..20,0..20).
unit(2).
