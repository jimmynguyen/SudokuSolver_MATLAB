function [board,isNakedPairsFound] = findNakedPairs(board)

    % store original board for comparison at the end
    oldBoard = board;

    % get empty squares
    [emptyRows, emptyCols] = find(getBoardValues(board)==0);

    % for each empty square
    for i = 1:length(emptyRows)
        
        rowIndex = emptyRows(i);
        colIndex = emptyCols(i);

        % get possibleValuesMask possible values mask
        possibleValues = board(rowIndex,colIndex).possibleValues;

        % only check if there are two possible values left
        if sum(possibleValues) == 2

            % check row for naked pairs
            for j = [1:colIndex-1,colIndex+1:9]
                if isequal(possibleValues,board(rowIndex,j).possibleValues)
                    for k = 1:9
                        if k ~= colIndex && k ~= j && board(rowIndex,k).value == 0
                            board(rowIndex,k).possibleValues = board(rowIndex,k).possibleValues & ~possibleValues;
                            
                            % check if naked single is found
                            if sum(board(rowIndex,k).possibleValues) == 1
                                board(rowIndex,k).value  = find(board(rowIndex,k).possibleValues);
                            end
                        end
                    end
                    break
                end
            end

            % check col for naked pairs
            for j = [1:rowIndex-1,rowIndex+1:9]
                if isequal(possibleValues,board(j,colIndex).possibleValues)
                    for k = 1:9
                        if k ~= rowIndex && k ~= j && board(k,colIndex).value == 0
                            board(k,colIndex).possibleValues = board(k,colIndex).possibleValues & ~possibleValues;
                            
                            % check if naked single is found
                            if sum(board(k,colIndex).possibleValues) == 1
                                board(k,colIndex).value  = find(board(k,colIndex).possibleValues);
                            end
                        end
                    end
                    break
                end
            end
            
            % check quadrant for naked pairs
            [~,rowIndices,colIndices] = getQuadrant(board,rowIndex,colIndex);
            for j = rowIndices
                for k = colIndices
                    if j ~= rowIndex && k ~= colIndex && board(j,k).value == 0 && isequal(possibleValues,board(j,k).possibleValues)
                        board(j,k).possibleValues = board(j,k).possibleValues & ~possibleValues;

                        % check if naked single is found
                        if sum(board(j,k).possibleValues) == 1
                            board(j,k).value  = find(board(j,k).possibleValues);
                        end
                    end
                end
            end

        end

    end

    isNakedPairsFound = ~isequal(board, oldBoard);

end