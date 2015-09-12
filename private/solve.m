function board = solve(board)
	board = solveHelper(board,'Naked Single');
end

function board = solveHelper(board,algorithm)

	if false == issolved(board)

		switch algorithm
			case 'Naked Single'
				board = findNakedSingle(board);
				board = solveHelper(board,'Naked Pairs');
			case 'Naked Pairs'
				[board,isNakedPairsFound] = findNakedPairs(board);
				if isNakedPairsFound
					board = solveHelper(board,'Naked Single');
				end
		end

	end

end