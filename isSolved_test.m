function issolved_test

	fprintf('\nTesting issolved.m ...\n\n');

	boardValues = [1 2 3, 4 5 6, 7 8 9;...
			       4 5 6, 7 8 9, 1 2 3;...
			       7 8 9, 1 2 3, 4 5 6;...
      
			       2 3 4, 5 6 7, 8 9 1;...
			       5 6 7, 8 9 1, 2 3 4;...
			       8 9 1, 2 3 4, 5 6 7;...
      
			       3 4 5, 6 7 8, 9 1 2;...
			       6 7 8, 9 1 2, 3 4 5;...
			       9 1 2, 3 4 5, 6 7 8];
			 
	% Test 1
	board = getBoard(boardValues);
	fprintf('Test 1: %s\n', assertTrue(isSolved(board)));

	% Test 2
	boardValues(end) = 10;
	board = getBoard(boardValues);
	fprintf('Test 2: %s\n', assertFalse(isSolved(board)));

	fprintf('\n');

end