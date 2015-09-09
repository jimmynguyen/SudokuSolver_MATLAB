function quadrant = getQuadrant(board, rowIndex, columnIndex)
	quadrantIndex = getQuadrantIndex(rowIndex,columnIndex);
	[rows, cols] = getRowAndColumnIndices(quadrantIndex);
	quadrant = board(rows,cols);
end

% Input: quadrant (value range: [1,9])
% Output: row and column indices of given quadrant (value range: [1,9])
function [rowIndices, columnIndices] = getRowAndColumnIndices(quadrantIndex)
    rowIndex = (ceil(quadrantIndex./3)-1).*3 + 1;
    rowIndices = rowIndex:rowIndex+2;
    columnIndex = mod(quadrantIndex-1, 3).*3 + 1;
    columnIndices = columnIndex:columnIndex+2;
end

% Input: row and column indices of board (value range: [1,9])
% Output: quadrant index (value range:[1,9])
function quadrantIndex = getQuadrantIndex(rowIndex, columnIndex)
    zeroIndexRow = ceil(rowIndex./3)-1;
    zeroIndexColumn = ceil(columnIndex./3)-1;
    quadrantIndex = zeroIndexRow.*3 + zeroIndexColumn + 1;
end