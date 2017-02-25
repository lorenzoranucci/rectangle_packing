%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%GENERAL%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
position(vertex(0,square(0)),coord(CENTER,CENTER)):- center(CENTER), square(0). 
%position(vertex(0,triangle(0)),coord(CENTER,CENTER)):- center(CENTER), triangle(0). 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%SQUARE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 


square_vertex_idxs(0..3).
%init square vertices
vertex(VERTEX_IDX, square(SQUARE_IDX) ):- square(SQUARE_IDX), square_vertex_idxs(VERTEX_IDX).

%%%%%%%%%%%%%%%position square vertices everywhere%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
position(vertex(VERTEX_IDX,square(I)), coord(X+UNIT, Y)):-
	square_vertex_idxs(VERTEX_IDX), square(I), vertex(VERTEX_IDX,square(I)), coord(X, Y), unit(UNIT), coord(X+UNIT, Y),
	position(vertex(VERTEX_IDX-1,square(I)), coord(X, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X-UNIT, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X, Y+UNIT)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X, Y-UNIT))
.

position(vertex(VERTEX_IDX,square(I)), coord(X-UNIT, Y)):-
	square_vertex_idxs(VERTEX_IDX), square(I), vertex(VERTEX_IDX,square(I)), coord(X, Y), unit(UNIT), coord(X-UNIT, Y),
	position(vertex(VERTEX_IDX-1,square(I)), coord(X, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X+UNIT, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X, Y+UNIT)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X, Y-UNIT))
.

position(vertex(VERTEX_IDX,square(I)), coord(X, Y+UNIT)):-
	square_vertex_idxs(VERTEX_IDX), square(I), vertex(VERTEX_IDX,square(I)), coord(X, Y), unit(UNIT), coord(X, Y+UNIT),
	position(vertex(VERTEX_IDX-1,square(I)), coord(X, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X+UNIT, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X-UNIT, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X, Y-UNIT))
.

position(vertex(VERTEX_IDX,square(I)), coord(X, Y-UNIT)):-
	square_vertex_idxs(VERTEX_IDX), square(I), vertex(VERTEX_IDX,square(I)), coord(X, Y), unit(UNIT), coord(X, Y-UNIT),
	position(vertex(VERTEX_IDX-1,square(I)), coord(X, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X+UNIT, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X-UNIT, Y)), 
	not position(vertex(VERTEX_IDX,square(I)), coord(X, Y+UNIT))

.
%%%%%%%%%%%%%%%END position square vertices everywhere%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







%:-not position(vertex(VERTEX_IDX, square(I)) , coord(X,Y))   , square(I),   square_vertex_idxs(VERTEX_IDX), coord(X,Y).
% first and last vertex have to have distance == UNIT

% vertex can not be in the same position each 
%:-position(vertex(VERTEX_IDX1,square(I)), coord(X, Y)), position(vertex(VERTEX_IDX2,square(I)), coord(X, Y)), VERTEX_IDX1!=VERTEX_IDX2, square_vertex_idxs(VERTEX_IDX1;VERTEX_IDX2), square(I), coord(X,Y).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Triangle%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%INPUT%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
square(0).
center(20/2).
coord(0..20,0..20).
unit(2).
