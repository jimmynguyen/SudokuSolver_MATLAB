function board = getBoard(boardValues)
	for i = 1:9
		for j = 1:9
			board(i,j).value = boardValues(i,j);
			if boardValues(i,j) == 0
				board(i,j).possibleValues = true(1,9);
			else
				board(i,j).possibleValues = [1:9] == boardValues(i,j);
			end
		end
	end
end