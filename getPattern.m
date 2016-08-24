function pattern = getPattern(scanLine)
bit = 1;
start = 0;
endPt = 0;
for i = 1: numel(scanLine)
    if scanLine(i) ~= bit
        start = i;
        break;
    end
end
n = numel(scanLine);
for i = 1:numel(scanLine)
    if scanLine(n-i) ~= bit
        endPt = n-i;
        break;
    end
end
bit = 0;
pattern = scanLine(start:endPt);
