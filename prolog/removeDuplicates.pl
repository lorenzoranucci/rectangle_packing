%[removeDuplicates].
%removeDuplicates([x,y,z,x,x,x,a,z,r,t],Result, Occurrences).
	%Occurrences = 3
	%Result = [y,z,x,a,r,t]
%removeDuplicates([y,z,x,x,x,a,z,r,t],Result, Occurrences).
	%Occurrences = 3
	%Result = [y,z,x,a,r,t]



%Remove all duplicates elements from a list and return the number of duplicate occurrences
removeDuplicates([],[],0).
removeDuplicates([X|List1],[X|SubResult2],Occurrences):-
	%SubResult1 = List1 without all X elements
	subtract(List1, [X], SubResult1),
	%XList= list with all the duplicate occurrences of X element
	subtract(List1,SubResult1, XList),
	%SubOccurrences1= number of duplicate occurrences of X element 
	length(XList, SubOccurrences1),
	%recursive call
	removeDuplicates(SubResult1,SubResult2, SubOccurrences2),
	Occurrences#=SubOccurrences1+SubOccurrences2
.
