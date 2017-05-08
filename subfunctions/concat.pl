%[concat].
%concat([point(5,0),point(5,1),point(5,2)|_] , [point(5,0),point(6,0),point(7,0)|_] , Result).

concat([],[],[]).

concat([],[X2|L2], [X2|Result]):- concat([],L2,Result).
concat([X1|L1],[X2|L2], [X1|Result]):- concat(L1,[X2|L2],Result).
