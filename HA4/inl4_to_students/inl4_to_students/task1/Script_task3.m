clear all;
close all;
clc;

F = [2 2 4; 3 3 6; -5 -10 -6];
a1 = [0; -2; 1];
a2 = [-3; 0; 1];
a3 = [-2; -4; 1];

b1 = [-8; -2; 1];
b2 = [0; 3; 1];
b3 = [4; 1; 1];

a = [a1, a2, a3];
b = [b1, b2, b3];

for i =1:3
    for j=1:3
        res = b(:,i)'*F*a(:,j);
        disp(strcat('b( ',string(i),') * a(',string(j),') = ',string(res)))
    end
end