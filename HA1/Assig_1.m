clear all;
close all;
clc;

%1. Image sampling
array = [];
for x = 0 : 0.25 : 1
  for y = 0: 0.25 : 1
    array = [ array x*(1-y)];
  end
end

image = reshape(array,5,5);
image = flip(image);
image
figure(); 
colormap(gray);
imagesc(image);
%imshow(uint8(image));
title("Continuous image");

discrete_image = round(31*image)
figure(); 
colormap(gray);
imagesc(discrete_image);
%imshow(uint8(discrete_image));
title("Discrete image");

%7. Image compression
B= [4 -1; -2 5].*[1/2 -1/2; 1/2 -1/2];
s =sum(B(:))
theta1 = 1/3*[0 1 0; 1 1 1; 1 0 1; 1 1 1];
theta2 = 1/2*[0 0 0; 0 0 0; 1 0 -1; 1 0 -1];
theta3 = 1/2*[1 0 -1; 1 0 -1; 0 0 0; 0 0 0];
theta4 = 1/3*[1 1 1; 1 0 1; -1 -1 -1; 0 -1 0];

f = [-2 6 3; 13 7 5; 7 1 8; -3 4 4];
x1 = sum(f.*theta1,'all');
x1
x2 = sum(f.*theta2,'all');
x2
x3 = sum(f.*theta3,'all');
x3
x4 = sum(f.*theta4,'all');
x4

fa = x1*theta1+x2*theta2+x3*theta3+x4*theta4
prod_diff = (f-fa).*(f-fa);
diff  = sum(prod_diff(:),'all')

P01 = theta1.*theta1;
P02 = theta2.*theta2;
P03 = theta3.*theta3;
P04 = theta4.*theta4;
sum(P01(:))
sum(P02(:))
sum(P03(:))
sum(P04(:))

p1 = theta1.*theta2;
p2 = theta1.*theta3;
p3 = theta1.*theta4;
sum(p1(:))
sum(p2(:))
sum(p3(:))

p21 = theta2.*theta1;
p22 = theta2.*theta3;
p23 = theta2.*theta4;
sum(p21(:))
sum(p22(:))
sum(p23(:))

p31 = theta3.*theta1;
p32 = theta3.*theta2;
p33 = theta3.*theta4;
sum(p31(:))
sum(p32(:))
sum(p33(:))

p41 = theta4.*theta1;
p42 = theta4.*theta2;
p43 = theta4.*theta3;
sum(p41(:))
sum(p42(:))
sum(p43(:))

p = theta1.*theta2.*theta3.*theta4;
sum(p(:))

e1 = 1/3*[1 1 1; 1 1 1; 1 1 1];
e2 = 1/(sqrt(6))*[1  1 1; 0 0 0; -1 -1 -1];
prr = e1.*e2;
sum(prr(:))
