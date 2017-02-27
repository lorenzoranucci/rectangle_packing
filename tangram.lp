%posiziona il vertice 0 di ogni quadrato su ogni vertice del quadrato 0
position(QUADRATO, 0, X, Y):-square(QUADRATO), QUADRATO>0, range(X;Y), square_vertex_idxs(V),
	position(0, V, X,Y), not other_position(QUADRATO, 0, X, Y).

%posiziona il vertice 1 di ogni quadrato che ha posizionato il vertice 0 su un vertice del quadrato 0. Il vertice 1 deve essere su un vertice adiacente a quello del quadrato 0.
position(QUADRATO, 1, X1, Y1):-square(QUADRATO), QUADRATO>0, range(X0;Y0;X1;Y1), square_vertex_idxs(V),
	position(QUADRATO, 0, X0,Y0),
	position(0,V,X0,Y0), 
	position(0,(V + 1) mod 4,X1,Y1), 
	not other_position(QUADRATO, 1, X1, Y1).



%%%%controlla che un vertice di un quadrato non abbia più coordinate
other_position(QUADRATO, 0, X, Y):-square(QUADRATO), range(X;Y;X2;Y2),
	position(QUADRATO, 0, X2, Y2),  Y!=Y2.
other_position(QUADRATO, 0, X, Y):-square(QUADRATO), range(X;Y;X2;Y2),
	position(QUADRATO, 0, X2, Y2),  X!=X2.

%%%%controlla che due vertici con id 0 di un poligono con indice !=0 non condividano lo stesso vertice della figura 0
other_position(QUADRATO, 0, X, Y):-square(QUADRATO; ALTRO_QUADRATO), range(X;Y;X2;Y2),
	position(ALTRO_QUADRATO, 0, X, Y),  QUADRATO!=ALTRO_QUADRATO, ALTRO_QUADRATO!=0.

%%posiziona vertice 0 square 0 al centro
position(0,0,CENTER,CENTER):- center(CENTER), square(0), range(CENTER).
%%posiziona vertice 1 square 0
position(0,1,CENTER+UNIT,CENTER):- center(CENTER), square(0), range(CENTER), unit(UNIT).
%%posiziona vertice 2 square 0
position(0,2, CENTER+UNIT,CENTER+UNIT):- center(CENTER), square(0), range(CENTER), unit(UNIT).
%%posiziona vertice 3 square 0
position(0,3,CENTER,CENTER+UNIT):- center(CENTER), square(0), range(CENTER), unit(UNIT).







%%%%init square vertices
square_vertex_idxs(0..3). 
vertex(SQUARE_IDX, VERTEX_IDX):- square(SQUARE_IDX), square_vertex_idxs(VERTEX_IDX).







square(0). square(1). square(2). square(3).square(4).square(5).
%piano cartesiano 100x100
range(0..10).
center(10/2).
unit(1).

#hide vertex(X,Y).
#hide range(X).
#hide center(X).
#hide unit(X).
#hide vertex(X,Y).
#hide square_vertex_idxs(X).
#hide other_position(Q,V,X,Y).
