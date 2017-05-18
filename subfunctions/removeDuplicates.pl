%[removeDuplicates].
%removeDuplicates([x,y,z,x,x,x,a,z,r,t],Result, Occurrences).


removeDuplicates([],[],0).
removeDuplicates([X|List1],[X|SubResult2],Occurrences):-
	subtract(List1, [X], SubResult1),
	subtract(List1,SubResult1, XList),
	length(XList, SubOccurrences1),
	removeDuplicates(SubResult1,SubResult2, SubOccurrences2),
	Occurrences#=SubOccurrences1+SubOccurrences2
.
