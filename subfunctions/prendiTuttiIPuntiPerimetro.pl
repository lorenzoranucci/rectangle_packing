getAllPerimeterPoints(
	[],
	Result
).


getAllPerimeterPoints(
	[rect(R,vertex(0,X0,Y0),vertex(1,X1,Y0),vertex(2,X1,Y1),vertex(3,X0,Y1), B, H)|Tail],
	Result
):-	pointsBetweenTwoPoints(point(X0,Y0), point(X1,Y0), Result1)	

	getAllPerimeterPoints(
		Tail,
		[
			Result|
			|
			pointsBetweenTwoPoints(point(X0,Y0), point(X0,Y1))|
			pointsBetweenTwoPoints(point(X0,Y1), point(X1,Y1))|
			pointsBetweenTwoPoints(point(X1,Y0), point(X1,Y1))
		]
	)

.
	

