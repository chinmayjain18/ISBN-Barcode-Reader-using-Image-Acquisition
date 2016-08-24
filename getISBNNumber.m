function ISBNnumber = getISBNNumber(pattern)
first6 = pattern(1:42);
last6 = pattern(47:end);
% Last 6 ISBN Number
ISBNLast6 = '';
for i=1:6
    bitPattern = '';
    n = 7*(i-1)+1;
    m = (7*i);
    for j=n:m
        bitPattern = strcat(bitPattern,int2str(last6(j)));
    end
    switch(bitPattern)
        case '0001101'
            ISBNLast6 = strcat(ISBNLast6,int2str(0));
        case '0011001'
            ISBNLast6 = strcat(ISBNLast6,int2str(1));
        case '0010011'
            ISBNLast6 = strcat(ISBNLast6,int2str(2));
        case '0111101'
            ISBNLast6 = strcat(ISBNLast6,int2str(3));
        case '0100011'
            ISBNLast6 = strcat(ISBNLast6,int2str(4));
        case '0110001'
            ISBNLast6 = strcat(ISBNLast6,int2str(5));
        case '0101111'
            ISBNLast6 = strcat(ISBNLast6,int2str(6));
        case '0111011'
            ISBNLast6 = strcat(ISBNLast6,int2str(7));
        case '0110111'
            ISBNLast6 = strcat(ISBNLast6,int2str(8));
        case '0001011'
            ISBNLast6 = strcat(ISBNLast6,int2str(9));
        otherwise
            ISBNLast6 = strcat(ISBNLast6,'n');
    end
end
% First 6 ISBN Numbers
ISBNFirst6 = '';
for i=1:6
    bitPattern = '';
    n = 7*(i-1)+1;
    m = (7*i);
    for j=n:m
        bitPattern = strcat(bitPattern,int2str(first6(j)));
    end
    number = getNumberScheme(bitPattern,i);
    ISBNFirst6 = strcat(ISBNFirst6,number);
end
% Concatenation to get the complete string
ISBNnumber = strcat(ISBNFirst6,ISBNLast6);