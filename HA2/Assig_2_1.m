clear all;
close all;
clc;

%im = imread('B2DBy.jpg');
im = imread('Untitled.png');
im2 = rgb2gray(im);
figure
imshow(im2)
title("Original image")
f1 = [-1 1];
f2 = [-1; 1];
f3 = 1/9*[ 1 1 1; 1 1 1; 1 1 1];
f4 = [0 -1 0; -1 4 -1; 0 -1 0];
f5 = [1 -1 -1 -1 -1; 1 1 -1 -1 -1; 1 1 1 -1 1; 1 1 1 1 -1; 1 1 1 1 1];

cv = conv2(im2,double(f1),'same');
cv2 = conv2(im2,double(f2),'same');
cv3 = conv2(im2,double(f3),'same');
cv4 = conv2(im2,double(f4),'same');
cv5 = conv2(im2,double(f5),'same');

figure
subplot(2,3,1)
colormap(gray)
imagesc(im2)
title("Original")
subplot(2,3,2)
colormap(gray)
imagesc(cv)
title("Filter 1")
subplot(2,3,3)
colormap(gray)
imagesc(cv2)
title("Filter 2")
subplot(2,3,4)
colormap(gray)
imagesc(cv3)
title("Filter 3")
subplot(2,3,5)
colormap(gray)
imagesc(cv4)
title("Filter 4")
subplot(2,3,6)
colormap(gray)
imagesc(cv5)
title("Filter 5")

%2_a
f = [3 4 7 4 3 5 6];
x = (1:7)';
xi = (1:7)';
F = interp1(x,f,xi);
figure
plot(x,F,'o',xi,F)
title("Linear Interpolation")

%2_c
x_n = -3:0.01:3;
g = [];
for x_i = x_n
    g = [g funct(x_i)];
end
figure;
plot(x_n,g);
title("g(x)")

x_2 = 1:0.01:7;
vect =[];
for x_j=x_2
    vect = [vect funct_new(x_j,f)];
end
figure
%plot(x_2,vect)
plot(x,f,'bo',x_2,vect,'r-')
title("Fg(x)")

diff(F)