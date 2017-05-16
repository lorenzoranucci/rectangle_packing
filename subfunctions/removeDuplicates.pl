%[removeDuplicates].
%removeDuplicates([x,y,z,x,x,x,a,z,r,t],Result).


removeDuplicates([],[]).
removeDuplicates([X|List1],[X|SubResult2]):-
	delete(List1, X, SubResult1),
	removeDuplicates(SubResult1,SubResult2)
.
