function isSolved = issolved(board)

	isSolved = true;

	for row = 1:9
		isSolved = isSolved && isequal(sort(board(row,:)),1:9);
	end

	if isSolved
		for col = 1:9
			isSolved = isSolved && isequal(sort(board(:,col)),[1:9]');
		end
	end

end