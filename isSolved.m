function isSolved = issolved(board)

	isSolved = true;
	boardValues = getBoardValues(board);

	for row = 1:9
		isSolved = isSolved && isequal(sort(boardValues(row,:)),1:9);
	end

	if isSolved
		for col = 1:9
			isSolved = isSolved && isequal(sort(boardValues(:,col)),[1:9]');
		end
	end

end