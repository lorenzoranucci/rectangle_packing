rect(0,b0,h0). 
%%rect(1,b1,h1). 

size(n).
range(0..n).
#hide range(X).
vertexIndex(0..3).

vertex(0,0,N/2,N/2):-rect(0, B, H), size(N).
vertex(0,1,N/2+B,N/2):-rect(0, B, H), size(N).
vertex(0,2,N/2+B,N/2+H):-rect(0, B, H), size(N).
vertex(0,3,N/2,N/2+H):-rect(0, B, H), size(N).

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
	Y<=Yb.
