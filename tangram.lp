






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Posizionare il lato 0 di ogni figura su ogni lato posizionato libero di un'altra figura%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%Essendo figure equilatere ogni lato è equivalente all'altro e quindi posso considerare come "base" della figura sempre il lato 0.



%%%%posiziono il vertice 0 di una figura1 in X,Y se: (1) il lato 0 non è già posizionato (2)esiste una (2.1) figura2 != figura1 (2.2) con un lato posizionato (2.3), libero e (2.4) con posizione X,Y
position(SQUARE,0,X,Y):-
	square(SQUARE;A_POSITIONED_SQUARE), range(X;Y), square_vertex_idxs(EDGE),
	not positioned_zero_edge_elsewhere(SQUARE,A_POSITIONED_SQUARE, EDGE),  	%%%% 	1) il lato 0 non è già posizionato
	SQUARE!=A_POSITIONED_SQUARE,						%%%%	2.1)esiste una figura2 != figura1...
	positioned_edge(A_POSITIONED_SQUARE , EDGE), 				%%%%	2.2)con un lato posizionato...
	not edge_taken_by_other(A_POSITIONED_SQUARE,EDGE, SQUARE),		%%%%	2.3)libero...
	position(A_POSITIONED_SQUARE, EDGE, X, Y).				%%%%	2.4)con posizione X,Y.





%%%%posiziono il vertice 1 in X1, Y1 di una figura1 se: 1)il lato 0 della figura non è già posizionato 2) il vertice 1 è posizionato 3).....
position(SQUARE, 1, X1, Y1):-
	square(SQUARE;A_POSITIONED_SQUARE), range(X0;X1;Y0;Y1),square_vertex_idxs(EDGE),
	not positioned_zero_edge_elsewhere(SQUARE,A_POSITIONED_SQUARE, EDGE),	%%%%	1) il lato 0 non è già posizionato
	position(SQUARE,0,X0,Y0),						%%%%	2) il vertice 0 è posizionato
	SQUARE!=A_POSITIONED_SQUARE,						%%%%	3)esiste una figura F2 != F1...
	position(A_POSITIONED_SQUARE, EDGE, X0, Y0),				%%%%	3.1)con un vertice con la stessa posizione del vertice 0 di F1...
	position(A_POSITIONED_SQUARE, (EDGE + 1) mod 4, X1, Y1).		%%%%	3.2)prendo la posizione X1,Y1 di EDGE->successore



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Controlla se il lato di una figura è posizionato%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%






%%%%Nota:  un lato posizionato è libero se non coincide con il lato 0 di un'altra figura. 




%%%%un lato X di una figura F è posizionato se i vertici X e ((X+1) mod #lati) della figura F sono posizionati "da qualche parte"
positioned_edge(SQUARE,SQUARE_EDGE):-square(SQUARE), range(X0;X1;Y0;Y1),square_vertex_idxs(SQUARE_EDGE),
	position(SQUARE, SQUARE_EDGE, X0 , Y0),
	position(SQUARE, (SQUARE_EDGE + 1) mod 4, X1 , Y1).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Controlla se il lato 0 di una figura è posizionato altrove%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%%%%Il lato 0 è già posizionato su un altro lato se sta su un altro lato della stessa figura o sta su un altro lato di un'altra figura posizionata

%%%%vero se il lato 0 di F1 è posizionato su un lato della figura F2 che non sia quello considerato
positioned_zero_edge_elsewhere(F1,F2, E_F2):-
	square(F1; F2), range(X0;X1;Y0;Y1),square_vertex_idxs(E234_F2;E_F2),
	position(F1, 0, X0 , Y0),					%%%%	il vertice 0 di F1 è posizionato in (X0,Y0)
	position(F1, 1 mod 4, X1 , Y1),					%%%%	il vertice 1 di F1 è posizionato in (X1,Y1)
	E234_F2!=E_F2,							%%%%	esiste un lato E234_F2 != E_F2...
	position(F2, E234_F2, X0 , Y0),					%%%%	e il vertice E234_F2 di F2 è posizionato in (X0,Y0)...
	position(F2, (E234_F2 + 1) mod 4, X1 , Y1).			%%%%	e il vertice E234_F2->successore di F2 è posizionato in (X1,Y1)
	


%%vero se il lato E della figura F1 è posizionato su un qualsiasi lato di una qualsiasi figura F3 != F2	
positioned_zero_edge_elsewhere(F1,F2, E_F2):-
	square(F1; F2; F3), range(X0;X1;Y0;Y1),square_vertex_idxs(E_F3;E_F2),
	position(F1, 0, X0 , Y0),					%%%%	il vertice 0 di F1 è posizionato in (X0,Y0)
	position(F1, 1 mod 4, X1 , Y1),					%%%%	il vertice 1 di F1 è posizionato in (X1,Y1)
	F2!=F3,	F1!=F3,							%%%%	esiste una terza figura F3 != F2 != F1
	position(F3, E_F3, X0 , Y0),					%%%%	con un vertice E_F3 posizionato in (X0,Y0)...
	position(F2, (E_F3 + 1) mod 4, X1 , Y1).			%%%%	e con un vertice E_F3->successore posizionato in (X1,Y1)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Controlla se il lato 0 di un'altra figura occupa già il nostro lato candidato%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



	
edge_taken_by_other(SQUARE,SQUARE_EDGE,OTHER_SQUARE):-
	square(SQUARE; OTHER_SQUARE; ANOTHER_SQUARE), range(X0;X1;Y0;Y1),square_vertex_idxs(SQUARE_EDGE),
	position(SQUARE, SQUARE_EDGE, X0 , Y0),
	position(SQUARE, (SQUARE_EDGE + 1) mod 4, X1 , Y1),
	position(ANOTHER_SQUARE, 0, X0 , Y0),
	position(ANOTHER_SQUARE, 1, X1 , Y1),
	OTHER_SQUARE!=ANOTHER_SQUARE, ANOTHER_SQUARE!=SQUARE.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Posiziona la figura con indice 0%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%posiziona vertice 0 square 0 al centro
position(0,0,CENTER,CENTER):- center(CENTER), square(0), range(CENTER).
%%posiziona vertice 1 square 0
position(0,1,CENTER+UNIT,CENTER):- center(CENTER), square(0), range(CENTER), unit(UNIT).
%%posiziona vertice 2 square 0
position(0,2, CENTER+UNIT,CENTER+UNIT):- center(CENTER), square(0), range(CENTER), unit(UNIT).
%%posiziona vertice 3 square 0
position(0,3,CENTER,CENTER+UNIT):- center(CENTER), square(0), range(CENTER), unit(UNIT).
%%dico che la figura 0 è next di una figura con indice -1 (che non esiste)






square_vertex_idxs(0..3).








square(0). square(1). 
%piano cartesiano 100x100
range(0..10).
center(10/2).
unit(1).


#hide edge_taken_by_other(SQUARE,SQUARE_EDGE,OTHER_SQUARE).
#hide positioned_zero_edge_elsewhere(F1,F2, E_F2).
#show positioned_edge(SQUARE,SQUARE_EDGE).
#hide range(X).
#hide center(X).
#hide unit(X).
#hide square_vertex_idxs(X).
#hide other_position(Q,V,X,Y).
#hide other_next(X,Y).
