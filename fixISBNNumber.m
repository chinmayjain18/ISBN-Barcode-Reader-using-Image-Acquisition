function ISBNnumber = fixISBNNumber(number)
ISBNnumber = '' ;%int2str(9);
if number(1) == 'n'
    ISBNnumber = strcat(ISBNnumber,int2str(7));
else
    ISBNnumber = strcat(ISBNnumber,number(1));
end
if number(2) == 'n'
    ISBNnumber = strcat(ISBNnumber,int2str(8));
else
    ISBNnumber = strcat(ISBNnumber,number(2));
end
tmp = number(3:end);
ISBNnumber = strcat(ISBNnumber,tmp);