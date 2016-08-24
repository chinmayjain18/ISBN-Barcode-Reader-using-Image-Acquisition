function theta = getRotation(J)
[y,x] = size(J);
x1 = 0;
x2 = 0;
j = 1;
while x1 == 0 && j<=x
    if J(1,j) == 0
        x1 = j;
    end
    j = j + 1;
end
j = 1;
while x2 == 0 && j<=x
    if J(370,j) == 0
        x2 = j;
    end
    j = j + 1;
end
X = [x1 x2;1 370;1 1];
Y = [x1 x1;1 370;1 1];
R_old = Y/X;
avg = abs(R_old(1,2)) + abs(R_old(2,1));
avg = avg/2;
theta = asind(avg);