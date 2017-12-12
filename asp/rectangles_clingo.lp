%%%%clingo -c n=10 -c b0=3 -c h0=1 -c b1=2 -c h1=1 -c b2=1 -c h2=1 ../rectangles_clingo.lp 0
#show vertex/4.

rect(0,b0,h0). 
rect(1,b1,h1). 
rect(2,b2,h2).

size(n).
range(0..n).
vertexIndex(0..3).

%%%%Locate first rect
vertex(0,0,N/2,N/2):-rect(0, B, H), size(N).
vertex(0,1,N/2+B,N/2):-rect(0, B, H), size(N).
vertex(0,2,N/2+B,N/2+H):-rect(0, B, H), size(N).
vertex(0,3,N/2,N/2+H):-rect(0, B, H), size(N).




%%%%Describe perimeter point
perimeterPoint(R, X, Ya):- rect(R, B, H), range(X),range(Xa),range(Ya),range(Xb),vertexIndex(Va), vertexIndex(Vb),
	vertex(R,Va,Xa,Ya),
	vertex(R,Vb,Xb,Ya),
	Xb>Xa,
	X>=Xa,
	X<=Xb.
perimeterPoint(R, Xa, Y):- rect(R, B, H), range(Y),range(Xa),range(Ya),range(Yb),vertexIndex(Va), vertexIndex(Vb),
	vertex(R,Va,Xa,Ya),
	vertex(R,Vb,Xa,Yb),
	Yb>Ya,
	Y>=Ya,
	Y<=Yb.

%%%%Describe area point	
areaPoint(R, X, Ya):- rect(R, B, H), range(X),range(Xa),range(Ya),range(Xb),
	perimeterPoint(R,Xa,Ya),
	perimeterPoint(R,Xb,Ya),
	Xb>Xa,
	X>=Xa,
	X<=Xb.
areaPoint(R, Xa, Y):- rect(R, B, H), range(Y),range(Xa),range(Ya),range(Yb),
	perimeterPoint(R,Xa,Ya),
	perimeterPoint(R,Xa,Yb),
	Yb>Ya,
	Y>=Ya,
	Y<=Yb
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Locate other rects vertices%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%vertex 0
vertex(R, 0, X0, Y0):-rect(R, B, H), rect(R2, B2, H2), range(X0),range(Y0),
	perimeterPoint(R2, X0, Y0),
	R!=R2,
	not vertexElsewhere(R,0,X0,Y0).

%%%%vertex 1
vertex(R, 1, X0+B, Y0):-rect(R, B, H),  range(X0),range(Y0),
	vertex(R, 0, X0, Y0),
	not vertexElsewhere(R,1,X0+B,Y0).
vertex(R, 1, X0-B, Y0):-rect(R, B, H),  range(X0),range(Y0),
	vertex(R, 0, X0, Y0),
	not vertexElsewhere(R,1,X0-B,Y0).
vertex(R, 1, X0+H, Y0):-rect(R, B, H),  range(X0),range(Y0),
	vertex(R, 0, X0, Y0),
	not vertexElsewhere(R,1,X0+H,Y0).
vertex(R, 1, X0-H, Y0):-rect(R, B, H),  range(X0),range(Y0),
	vertex(R, 0, X0, Y0),
	not vertexElsewhere(R,1,X0-H,Y0).
vertex(R, 1, X0, Y0+B):-rect(R, B, H),  range(X0),range(Y0),
	vertex(R, 0, X0, Y0),
	not vertexElsewhere(R,1,X0,Y0+B).
vertex(R, 1, X0, Y0-B):-rect(R, B, H),  range(X0),range(Y0),
	vertex(R, 0, X0, Y0),
	not vertexElsewhere(R,1,X0,Y0-B).
vertex(R, 1, X0, Y0+H):-rect(R, B, H),  range(X0),range(Y0),
	vertex(R, 0, X0, Y0),
	not vertexElsewhere(R,1,X0,Y0+H).
vertex(R, 1, X0, Y0-H):-rect(R, B, H),  range(X0),range(Y0),
	vertex(R, 0, X0, Y0),
	not vertexElsewhere(R,1,X0,Y0-H).

%%%%vertex2
vertex(R,2,Xa+B,Ya+H):-rect(R,B,H),vertexIndex(Va), vertexIndex( Vb), range(Xa),range( Ya),
	Va<2, Vb<2, Va!=Vb,
	vertex(R,Va,Xa,Ya),
	vertex(R,Vb,Xa+B, Ya),
	not vertexElsewhere(R,2,Xa+B,Ya+H).
vertex(R,2,Xa+B,Ya-H):-rect(R,B,H),vertexIndex(Va), vertexIndex( Vb), range(Xa),range( Ya),
	Va<2, Vb<2, Va!=Vb,
	vertex(R,Va,Xa,Ya),
	vertex(R,Vb,Xa+B, Ya),
	not vertexElsewhere(R,2,Xa+B,Ya-H).
vertex(R,2,Xa+H,Ya+B):-rect(R,B,H),vertexIndex(Va), vertexIndex( Vb), range(Xa),range( Ya),
	Va<2, Vb<2, Va!=Vb,
	vertex(R,Va,Xa,Ya),
	vertex(R,Vb,Xa+H, Ya),
	not vertexElsewhere(R,2,Xa+H,Ya+B).
vertex(R,2,Xa+H,Ya-B):-rect(R,B,H),vertexIndex(Va), vertexIndex( Vb), range(Xa),range( Ya),
	Va<2, Vb<2, Va!=Vb,
	vertex(R,Va,Xa,Ya),
	vertex(R,Vb,Xa+H, Ya),
	not vertexElsewhere(R,2,Xa+H,Ya-B).

vertex(R,2,Xa+H,Ya+B):-rect(R,B,H),vertexIndex(Va), vertexIndex( Vb), range(Xa),range( Ya),
	Va<2, Vb<2, Va!=Vb,
	vertex(R,Va,Xa, Ya),
	vertex(R,Vb,Xa, Ya+B),
	not vertexElsewhere(R,2,Xa+H,Ya+B).
vertex(R,2,Xa-H,Ya+B):-rect(R,B,H),vertexIndex(Va), vertexIndex( Vb), range(Xa),range( Ya),
	Va<2, Vb<2, Va!=Vb,
	vertex(R,Va,Xa, Ya),
	vertex(R,Vb,Xa, Ya+B),
	not vertexElsewhere(R,2,Xa-H,Ya+B).
vertex(R,2,Xa+B,Ya+H):-rect(R,B,H),vertexIndex(Va), vertexIndex( Vb), range(Xa),range( Ya),
	Va<2, Vb<2, Va!=Vb,
	vertex(R,Va,Xa, Ya),
	vertex(R,Vb,Xa, Ya+H),
	not vertexElsewhere(R,2,Xa+B,Ya+H).
vertex(R,2,Xa-B,Ya+H):-rect(R,B,H),vertexIndex(Va), vertexIndex( Vb), range(Xa),range( Ya),
	Va<2, Vb<2, Va!=Vb,
	vertex(R,Va,Xa, Ya),
	vertex(R,Vb,Xa, Ya+H),
	not vertexElsewhere(R,2,Xa-B,Ya+H).


%%%%vertex3
vertex(R,3,Xb,Ya):-rect(R,B,H),vertexIndex(Va), vertexIndex( Vb), vertexIndex( Vc), range(Xa),range( Ya),range(Xb),range(Yb),
	Va!=Vb, Va!=Vc, Vb!=Vc,Va<3, Vb<3, Vc<3,
	vertex(R,Va,Xa,Ya),
	vertex(R,Vb,Xa,Yb),
	vertex(R,Vc,Xb,Yb).



%%%% check not positioned elsewhere
vertexElsewhere(R,V,X,Y):- rect(R,B,H), vertexIndex(V), range(X),range(Y),range(X1),range(Y1),
	vertex(R,V,X1,Y1),
	X!=X1.

vertexElsewhere(R,V,X,Y):- rect(R,B,H), vertexIndex(V), range(X),range(Y),range(X1),range(Y1),
	vertex(R,V,X1,Y1),
	Y!=Y1.









%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Answers filtering%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Discard answers with rectangle overlapping. There is an overlapping when to rectangles share the same "unit square" (e.g. two rectangles with the following common area points (10,10),(11,10),(10,11),(11,11))
:-rect(Ra,Ba,Ha),rect(Rb,Bb,Hb), range(X),range(Y), Ra!=Rb,
	areaPoint(Ra,X,Y), areaPoint(Rb,X,Y), 
	areaPoint(Ra,X+1,Y), areaPoint(Rb,X+1,Y),
	areaPoint(Ra,X,Y+1), areaPoint(Rb,X,Y+1),
	areaPoint(Ra,X+1,Y+1), areaPoint(Rb,X+1,Y+1).


commonPerimeterPoint(R1,R2,X,Y):-range(X),range(Y),rect(R1,B1,H1),rect(R2,B2,H2), R2>R1, perimeterPoint(R1,X,Y), perimeterPoint(R2,X,Y).

#maximize{R1,R2,X,Y : commonPerimeterPoint(R1,R2,X,Y)}.





