rect(0,b0,h0). 
rect(1,b1,h1). 

size(n).
range(0..n).
#hide range(X).
vertexIndex(0..3).

%%%%Locate first rect
vertex(0,0,N/2,N/2):-rect(0, B, H), size(N).
vertex(0,1,N/2+B,N/2):-rect(0, B, H), size(N).
vertex(0,2,N/2+B,N/2+H):-rect(0, B, H), size(N).
vertex(0,3,N/2,N/2+H):-rect(0, B, H), size(N).




%%%%Describe perimeter point
#hide perimeterPoint(R, X, Ya).
perimeterPoint(R, X, Ya):- rect(R, B, H), range(X;Xa;Ya;Xb),vertexIndex(Va;Vb),
	vertex(R,Va,Xa,Ya),
	vertex(R,Vb,Xb,Ya),
	Xb>Xa,
	X>=Xa,
	X<=Xb.
perimeterPoint(R, Xa, Y):- rect(R, B, H), range(Y;Xa;Ya;Yb),vertexIndex(Va;Vb),
	vertex(R,Va,Xa,Ya),
	vertex(R,Vb,Xa,Yb),
	Yb>Ya,
	Y>=Ya,
	Y<=Yb.

%%%%Describe area point	
#hide areaPoint(R, X, Ya).
areaPoint(R, X, Ya):- rect(R, B, H), range(X;Xa;Ya;Xb),
	perimeterPoint(R,Xa,Ya),
	perimeterPoint(R,Xb,Ya),
	Xb>Xa,
	X>=Xa,
	X<=Xb.
areaPoint(R, Xa, Y):- rect(R, B, H), range(Y;Xa;Ya;Yb),
	perimeterPoint(R,Xa,Ya),
	perimeterPoint(R,Xa,Yb),
	Yb>Ya,
	Y>=Ya,
	Y<=Yb
.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Locate other rects vertices%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%vertex 0
vertex(R, 0, X0, Y0):-rect(R, B, H), rect(R2, B2, H2), range(X0;Y0),
	perimeterPoint(R2, X0, Y0),
	R!=R2,
	not vertexElsewhere(R,0,X0,Y0).

%%%%vertex 1
vertex(R, 1, X0+B, Y0):-rect(R, B, H),  range(X0;Y0),
	vertex(R, 0, X0, Y0),
	not vertexElsewhere(R,1,X0+B,Y0).
vertex(R, 1, X0-B, Y0):-rect(R, B, H),  range(X0;Y0),
	vertex(R, 0, X0, Y0),
	not vertexElsewhere(R,1,X0-B,Y0).
vertex(R, 1, X0+H, Y0):-rect(R, B, H),  range(X0;Y0),
	vertex(R, 0, X0, Y0),
	not vertexElsewhere(R,1,X0+H,Y0).
vertex(R, 1, X0-H, Y0):-rect(R, B, H),  range(X0;Y0),
	vertex(R, 0, X0, Y0),
	not vertexElsewhere(R,1,X0-H,Y0).
vertex(R, 1, X0, Y0+B):-rect(R, B, H),  range(X0;Y0),
	vertex(R, 0, X0, Y0),
	not vertexElsewhere(R,1,X0,Y0+B).
vertex(R, 1, X0, Y0-B):-rect(R, B, H),  range(X0;Y0),
	vertex(R, 0, X0, Y0),
	not vertexElsewhere(R,1,X0,Y0-B).
vertex(R, 1, X0, Y0+H):-rect(R, B, H),  range(X0;Y0),
	vertex(R, 0, X0, Y0),
	not vertexElsewhere(R,1,X0,Y0+H).
vertex(R, 1, X0, Y0-H):-rect(R, B, H),  range(X0;Y0),
	vertex(R, 0, X0, Y0),
	not vertexElsewhere(R,1,X0,Y0-H).

%%%%vertex2
vertex(R,2,Xa+B,Ya+H):-rect(R,B,H),vertexIndex(Va; Vb), range(Xa; Ya),
	Va<2, Vb<2, Va!=Vb,
	vertex(R,Va,Xa,Ya),
	vertex(R,Vb,Xa+B, Ya),
	not vertexElsewhere(R,2,Xa+B,Ya+H).
vertex(R,2,Xa+B,Ya-H):-rect(R,B,H),vertexIndex(Va; Vb), range(Xa; Ya),
	Va<2, Vb<2, Va!=Vb,
	vertex(R,Va,Xa,Ya),
	vertex(R,Vb,Xa+B, Ya),
	not vertexElsewhere(R,2,Xa+B,Ya-H).
vertex(R,2,Xa+H,Ya+B):-rect(R,B,H),vertexIndex(Va; Vb), range(Xa; Ya),
	Va<2, Vb<2, Va!=Vb,
	vertex(R,Va,Xa,Ya),
	vertex(R,Vb,Xa+H, Ya),
	not vertexElsewhere(R,2,Xa+H,Ya+B).
vertex(R,2,Xa+H,Ya-B):-rect(R,B,H),vertexIndex(Va; Vb), range(Xa; Ya),
	Va<2, Vb<2, Va!=Vb,
	vertex(R,Va,Xa,Ya),
	vertex(R,Vb,Xa+H, Ya),
	not vertexElsewhere(R,2,Xa+H,Ya-B).

vertex(R,2,Xa+H,Ya+B):-rect(R,B,H),vertexIndex(Va; Vb), range(Xa; Ya),
	Va<2, Vb<2, Va!=Vb,
	vertex(R,Va,Xa, Ya),
	vertex(R,Vb,Xa, Ya+B),
	not vertexElsewhere(R,2,Xa+H,Ya+B).
vertex(R,2,Xa-H,Ya+B):-rect(R,B,H),vertexIndex(Va; Vb), range(Xa; Ya),
	Va<2, Vb<2, Va!=Vb,
	vertex(R,Va,Xa, Ya),
	vertex(R,Vb,Xa, Ya+B),
	not vertexElsewhere(R,2,Xa-H,Ya+B).
vertex(R,2,Xa+B,Ya+H):-rect(R,B,H),vertexIndex(Va; Vb), range(Xa; Ya),
	Va<2, Vb<2, Va!=Vb,
	vertex(R,Va,Xa, Ya),
	vertex(R,Vb,Xa, Ya+H),
	not vertexElsewhere(R,2,Xa+B,Ya+H).
vertex(R,2,Xa-B,Ya+H):-rect(R,B,H),vertexIndex(Va; Vb), range(Xa; Ya),
	Va<2, Vb<2, Va!=Vb,
	vertex(R,Va,Xa, Ya),
	vertex(R,Vb,Xa, Ya+H),
	not vertexElsewhere(R,2,Xa-B,Ya+H).


%%%%vertex3
vertex(R,3,Xb,Ya):-rect(R,B,H),vertexIndex(Va; Vb; Vc), range(Xa; Ya;Xb;Yb),
	Va!=Vb, Va!=Vc, Vb!=Vc,Va<3, Vb<3, Vc<3,
	vertex(R,Va,Xa,Ya),
	vertex(R,Vb,Xa,Yb),
	vertex(R,Vc,Xb,Yb).



%%%% check not positioned elsewhere
#hide vertexElsewhere(R,V,X,Y).
vertexElsewhere(R,V,X,Y):- rect(R,B,H), vertexIndex(V), range(X;Y;X1;Y1),
	vertex(R,V,X1,Y1),
	X!=X1.

vertexElsewhere(R,V,X,Y):- rect(R,B,H), vertexIndex(V), range(X;Y;X1;Y1),
	vertex(R,V,X1,Y1),
	Y!=Y1.
