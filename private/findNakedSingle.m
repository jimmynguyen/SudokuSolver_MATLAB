function board = findNakedSingleHelper(board)
	[board,~] = findNakedSingleHelper(board,true);
end

function [board,isNakedSingleFound] = findNakedSingleHelper(board,isNakedSingleFound)

	% runs until can't find anymore naked singles
	if isNakedSingleFound

		% store original board for comparison at the end
		oldBoard = board;

		% get empty squares
		[emptyRows, emptyCols] = find(getBoardValues(board)==0);

		% for each empty square
		for i = 1:length(emptyRows)
			
			rowIndex = emptyRows(i);
			colIndex = emptyCols(i);

			% get row
			row = [board(rowIndex,[1:colIndex-1,colIndex+1:end]).value];

			% get col
			col = [board([1:rowIndex-1,rowIndex+1:end],colIndex).value];
			
			% get quadrant
			quadrant = getQuadrant(board,rowIndex,colIndex)

			% get possibleValuesMask possible values mask
			possibleValues = board(rowIndex,colIndex).possibleValues;

			% fill out possible values mask by looping through each relevant square
			for j = [row(:);col(:);quadrant(:)]' 
				if j > 0 & possibleValues(j)
					possibleValues(j) = false;
				end
			end

			% check if naked single is found
			if sum(possibleValues) == 1
				board(rowIndex,colIndex).value = find(possibleValues);
			end

			board(rowIndex,colIndex).possibleValues = possibleValues;

		end

		isNakedSingleFound = ~isequal(board, oldBoard);

		[board,isNakedSingleFound] = findNakedSingleHelper(board,isNakedSingleFound)
	end

end