







%posiziono il lato 0 di una figura in X,Y se: 1) il lato 0 non è già posizionato 2)esiste un'altra figura 2.1) con un lato posizionato 2.2), libero e 2.3) con posizione X,Y
position(SQUARE,0,X,Y):-
	square(SQUARE;A_POSITIONED_SQUARE), range(X;Y), square_vertex_idxs(EDGE),
	not positioned_edge_elsewhere(SQUARE,0,A_POSITIONED_SQUARE, EDGE),  	%%%% 	1) il lato 0 non è già posizionato
	positioned_edge(A_POSITIONED_SQUARE , EDGE), 				%%%%	2.1)esiste un'altra figura  con un lato posizionato...
	not edge_taken_by_other(A_POSITIONED_SQUARE,EDGE, SQUARE),		%%%%	2.2)libero
	position(A_POSITIONED_SQUARE, EDGE, X, Y).				%%%%	2.3)con posizione X,Y

position(SQUARE, 1, X1, Y1):-
	square(SQUARE;A_POSITIONED_SQUARE), range(X0;Y0;X1;Y1), square_vertex_idxs(V),	
	position(SQUARE, 0, X0,Y0),%%prendo la posizione del vertice 0 del quadrato da posizionare
	position(A_POSITIONED_SQUARE,V,X0,Y0), %%prendo l'indice V del vertice del predecessore con cui la figura da posizionare condivide il vertice
	position(A_POSITIONED_SQUARE,(V + 1) mod 4,X1,Y1),%% ce n'è sempre al più uno
	not positioned_edge_elsewhere(SQUARE,1,A_POSITIONED_SQUARE, EDGE).

%%% vero se il lato è posizionato su un altro vertice della stessa figura o se posizionato su vertice di un'altra figura
positioned_edge_elsewhere(SQUARE,SQUARE_EDGE,A_POSITIONED_SQUARE, A_POSITIONED_SQUARE_EDGE):-
	square(SQUARE;A_POSITIONED_SQUARE;ANOTHER_POSITIONED_SQUARE), square_vertex_idxs(V), range(X_APS;Y_APS),
	position( ANOTHER_POSITIONED_SQUARE, V, X_APS, Y_APS), A_POSITIONED_SQUARE_EDGE!=ANOTHER_POSITIONED_SQUARE, 		%% c'è un'altra square posizionata e per ogni vertice...
	position( SQUARE, SQUARE_EDGE, X_APS, Y_APS).			%% la square corrente ha il vertice corrente posizionato su uno di tali vertici => il lato è già posizionato 
	
positioned_edge_elsewhere(SQUARE,SQUARE_EDGE,A_POSITIONED_SQUARE, A_POSITIONED_SQUARE_EDGE):-
	square(SQUARE;A_POSITIONED_SQUARE), square_vertex_idxs(V), range(X;Y),
	position( POSITIONED_SQUARE, V, X, Y), V!=A_POSITIONED_SQUARE_EDGE,	%%%%c'è altro lato della square posizionata...
	position( SQUARE, SQUARE_EDGE, X, Y).	%%%% su cui è posizionato il lato da posizionare


%%un lato è identificato dal minore degli indici dei vertici che lo sottendono e dall'indice della figura a cui appartiene

positioned_edge(SQUARE,SQUARE_EDGE):-square(SQUARE), range(X0;X1;Y1;Y2),
	position(SQUARE, SQUARE_EDGE, X0 , Y0),
	position(SQUARE, (SQUARE_EDGE + 1) mod 4, X1 , Y1).
	

edge_taken_by_other(SQUARE,SQUARE_EDGE,OTHER_SQUARE):-
	square(SQUARE; OTHER_SQUARE; ANOTHER_SQUARE), range(X0;X1;Y0;Y1),
	position(SQUARE, SQUARE_EDGE, X0 , Y0),
	position(SQUARE, (SQUARE_EDGE + 1) mod 4, X1 , Y1),
	position(ANOTHER_SQUARE, 0, X0 , Y0),
	position(ANOTHER_SQUARE, 1, X1 , Y1),
	OTHER_SQUARE!=ANOTHER_SQUARE, ANOTHER_SQUARE!=SQUARE.



%%posiziona vertice 0 square 0 al centro
position(0,0,CENTER,CENTER):- center(CENTER), square(0), range(CENTER).
%%posiziona vertice 1 square 0
position(0,1,CENTER+UNIT,CENTER):- center(CENTER), square(0), range(CENTER), unit(UNIT).
%%posiziona vertice 2 square 0
position(0,2, CENTER+UNIT,CENTER+UNIT):- center(CENTER), square(0), range(CENTER), unit(UNIT).
%%posiziona vertice 3 square 0
position(0,3,CENTER,CENTER+UNIT):- center(CENTER), square(0), range(CENTER), unit(UNIT).
%%dico che la figura 0 è next di una figura con indice -1 (che non esiste)








%%%%init square vertices
square_vertex_idxs(0..3). 
vertex(SQUARE_IDX, VERTEX_IDX):- square(SQUARE_IDX), square_vertex_idxs(VERTEX_IDX).







square(0). square(1). 
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
#hide other_next(X,Y).
