function number = getNumberScheme(bitPattern,i)
scheme = 'B';
if (i == 1) || (i == 4) || (i== 6)
    scheme = 'A';
end
switch (scheme)
    case 'A'
        switch(bitPattern)
            case '1110010'
                number = int2str(0);
            case '1100110'
                number = int2str(1);
            case '1101100'
                number = int2str(2);
            case '1000010'
                number = int2str(3);
            case '1011100'
                number = int2str(4);
            case '1001110'
                number = int2str(5);
            case '1010000'
                number = int2str(6);
            case '1000100'
                number = int2str(7);
            case '1001000'
                number = int2str(8);
            case '1110100'
                number = int2str(9);
            otherwise
                number = 'n';
        end
    case 'B'
        switch(bitPattern)
            case '1011000'
                number = int2str(0);
            case '1001100'
                number = int2str(1);
            case '1100100'
                number = int2str(2);
            case '1011110'
                number = int2str(3);
            case '1100010'
                number = int2str(4);
            case '1000110'
                number = int2str(5);
            case '1111010'
                number = int2str(6);
            case '1101110'
                number = int2str(7);
            case '1110110'
                number = int2str(8);
            case '1101000'
                number = int2str(9);
            otherwise
                number = 'n';
        end
end