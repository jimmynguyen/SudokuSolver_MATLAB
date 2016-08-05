function getQuadrant_test

	fprintf('\nTesting getQuadrant.m ...\n\n');

	boardValues = [1 2 3, 4 5 6, 7 8 9;...
			       4 5 6, 7 8 9, 1 2 3;...
			       7 8 9, 1 2 3, 4 5 6;...
      
			       2 3 4, 5 6 7, 8 9 1;...
			       5 6 7, 8 9 1, 2 3 4;...
			       8 9 1, 2 3 4, 5 6 7;...
      
			       3 4 5, 6 7 8, 9 1 2;...
			       6 7 8, 9 1 2, 3 4 5;...
			       9 1 2, 3 4 5, 6 7 8];

	board = getBoard(boardValues);

	quadrant1 = [board(1:3,1:3).value];
	quadrant8 = [board(7:9,4:6).value];

	% Test 1
	fprintf('Test 1: %s\n', assertEquals(getQuadrant(board,1,3),quadrant1([1:6,8:9])));

	% Test 2
	fprintf('Test 2: %s\n', assertEquals(getQuadrant(board,2,1),quadrant1([1,3:9])));

	% Test 3
	fprintf('Test 3: %s\n', assertEquals(getQuadrant(board,3,3),quadrant1(1:8)));

	% Test 4
	fprintf('Test 4: %s\n', assertEquals(getQuadrant(board,9,6),quadrant8(1:8)));

	% Test 5
	fprintf('Test 5: %s\n', assertEquals(getQuadrant(board,8,5),quadrant8([1:4,6:9])));

	% Test 6
	fprintf('Test 6: %s\n', assertEquals(getQuadrant(board,7,5),quadrant8([1:3,5:9])));

	fprintf('\n');

end