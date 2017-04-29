elimdoppi(Xs,Ys):-elimdoppiaux(Xs,[],Ys).
elimdoppiaux([],Ys,Ys).
elimdoppiaux([X|Xs],Acc,Ys) :- member(X,Acc),
elimdoppiaux(Xs,Acc,Ys).
elimdoppiaux([X|Xs],Acc,Ys) :- nonmember(X, Acc),
elimdoppiaux(Xs,[X|Acc],Ys).


member(X,[X|Xs]).
member(X,[Y|Ys]) :- member(X,Ys).
nonmember(X,[Y|Ys]) :- X\==Y, nonmember(X,Ys).
nonmember(X,[]).
