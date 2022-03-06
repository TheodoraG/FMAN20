clear all;
close all;
clc;

%load the data
load('assignment1bases.mat')

%call projection function using base 1 for an image in the first stack 
[up11, r11] = projection(stacks{1}(:,:,1),bases{1}(:,:,1),bases{1}(:,:,2),bases{1}(:,:,3),bases{1}(:,:,4));
%call projection function using base 2 for an image in the first stack 
[up12, r12] = projection(stacks{1}(:,:,1),bases{2}(:,:,1),bases{2}(:,:,2),bases{2}(:,:,3),bases{2}(:,:,4));
%call projection function using base 3 for an image in the first stack 
[up13, r13] = projection(stacks{1}(:,:,1),bases{3}(:,:,1),bases{3}(:,:,2),bases{3}(:,:,3),bases{3}(:,:,4));
up11;
r11;


%call projection function using base 1 for an image in the second stack
[up21, r21] = projection(stacks{2}(:,:,1),bases{1}(:,:,1),bases{1}(:,:,2),bases{1}(:,:,3),bases{1}(:,:,4));
%call projection function using base 2 for an image in the second stack
[up22, r22] = projection(stacks{2}(:,:,1),bases{2}(:,:,1),bases{2}(:,:,2),bases{2}(:,:,3),bases{2}(:,:,4));
%call projection function using base 3 for an image in the second stack
[up23, r23] = projection(stacks{2}(:,:,1),bases{3}(:,:,1),bases{3}(:,:,2),bases{3}(:,:,3),bases{3}(:,:,4));

%see the original images and the projected ones
figure(); 
colormap(gray);
imagesc(stacks{1}(:,:,1));
title("Original image - stack 1");

figure(); 
colormap(gray);
imagesc(stacks{1}(:,:,2));
title("Original image - stack 1");

figure(); 
colormap(gray);
imagesc(up11);
title("Projected image - stack 1 - base 1");

figure(); 
colormap(gray);
imagesc(up12);
title("Projected image - stack 1 - base 2");

figure(); 
colormap(gray);
imagesc(up13);
title("Projected image - stack 1 - base 3");


figure(); 
colormap(gray);
imagesc(stacks{2}(:,:,1));
title("Original image - stack 2");

figure(); 
colormap(gray);
imagesc(stacks{2}(:,:,2));
title("Original image - stack 2");

figure(); 
colormap(gray);
imagesc(up21);
title("Projected image - stack 2 - base 1");

figure(); 
colormap(gray);
imagesc(up22);
title("Projected image - stack 2 - base 2");

figure(); 
colormap(gray);
imagesc(up23);
title("Projected image - stack 2 - base 3");

%test the function
array_images_11 = [];
array_error_11 = [];
%iterate through all test images from stack 1
for i = 1:400
    %use base 1 for projection
    [up_new, r_new] = projection(stacks{1}(:,:,i),bases{1}(:,:,1),bases{1}(:,:,2),bases{1}(:,:,3),bases{1}(:,:,4));
    %save the projections
    array_images_11 = [array_images_11 up_new];
    %save the error norm
    array_error_11 = [array_error_11 r_new];
end
%compute the mean for the error norms
mean_val_11  = mean(array_error_11,'all');
mean_val_11

array_images_12 = [];
array_error_12 = [];
%iterate through all test images from stack 1
for i = 1:400
    %use base 2 for projection
    [up_new, r_new] = projection(stacks{1}(:,:,i),bases{2}(:,:,1),bases{2}(:,:,2),bases{2}(:,:,3),bases{2}(:,:,4));
    %save the projections
    array_images_12 = [array_images_12 up_new];
    %save the error norm
    array_error_12 = [array_error_12 r_new];
end
%compute the mean for the error norms
mean_val_12  = mean(array_error_12,'all');
mean_val_12

array_images_13 = [];
array_error_13 = [];
%iterate through all test images from stack 1
for i = 1:400
    %use base 3 for projection
    [up_new, r_new] = projection(stacks{1}(:,:,i),bases{3}(:,:,1),bases{3}(:,:,2),bases{3}(:,:,3),bases{3}(:,:,4));
    %save the projections
    array_images_13 = [array_images_13 up_new];
    %save the error norm
    array_error_13 = [array_error_13 r_new];
end
%compute the mean for the error norms
mean_val_13  = mean(array_error_13,'all');
mean_val_13

array_images_21 = [];
array_error_21 = [];
%iterate through all test images from stack 2
for i = 1:400
    %use base 1 for projection
    [up_new, r_new] = projection(stacks{2}(:,:,i),bases{1}(:,:,1),bases{1}(:,:,2),bases{1}(:,:,3),bases{1}(:,:,4));
    %save the projections
    array_images_21 = [array_images_21 up_new];
    %save the error norm
    array_error_21 = [array_error_21 r_new];
end
%compute the mean for the error norms
mean_val_21  = mean(array_error_21,'all');
mean_val_21

array_images_22 = [];
array_error_22 = [];
%iterate through all test images from stack 2
for i = 1:400
    %use base 2 for projection
    [up_new, r_new] = projection(stacks{2}(:,:,i),bases{2}(:,:,1),bases{2}(:,:,2),bases{2}(:,:,3),bases{2}(:,:,4));
    %save the projections
    array_images_22 = [array_images_22 up_new];
    %save the error norm
    array_error_22 = [array_error_22 r_new];
end
%compute the mean for the error norms
mean_val_22  = mean(array_error_22,'all');
mean_val_22


array_images_23 = [];
array_error_23 = [];
%iterate through all test images from stack 2
for i = 1:400
    %use base 3 for projection
    [up_new, r_new] = projection(stacks{2}(:,:,i),bases{3}(:,:,1),bases{3}(:,:,2),bases{3}(:,:,3),bases{3}(:,:,4));
    %save the projections
    array_images_23 = [array_images_23 up_new];
    %save the error norm
    array_error_23 = [array_error_23 r_new];
end
%compute the mean for the error norms
mean_val_23  = mean(array_error_23,'all');
mean_val_23

figure();
subplot(4,2,1)
colormap(gray);
imagesc(bases{1}(:,:,1));
title("Base 1 - element 1");
subplot(4,2,2)
colormap(gray);
imagesc(bases{1}(:,:,2));
title("Base 1 - element 2");
subplot(4,2,3)
colormap(gray);
imagesc(bases{1}(:,:,3));
title("Base 1 - element 3");
subplot(4,2,4)
colormap(gray);
imagesc(bases{1}(:,:,4));
title("Base 1 - element 4");

figure();
subplot(4,2,1)
colormap(gray);
imagesc(bases{2}(:,:,1));
title("Base 2 - element 1");
subplot(4,2,2)
colormap(gray);
imagesc(bases{2}(:,:,2));
title("Base 2 - element 2");
subplot(4,2,3)
colormap(gray);
imagesc(bases{2}(:,:,3));
title("Base 2 - element 3");
subplot(4,2,4)
colormap(gray);
imagesc(bases{2}(:,:,4));
title("Base 2 - element 4");

figure();
subplot(4,2,1)
colormap(gray);
imagesc(bases{3}(:,:,1));
title("Base 3 - element 1");
subplot(4,2,2)
colormap(gray);
imagesc(bases{3}(:,:,2));
title("Base 3 - element 2");
subplot(4,2,3)
colormap(gray);
imagesc(bases{3}(:,:,3));
title("Base 3 - element 3");
subplot(4,2,4)
colormap(gray);
imagesc(bases{3}(:,:,4));
title("Base 3 - element 4");
%plot(bases{3}(:,:,1),bases{3}(:,:,2),bases{3}(:,:,3),bases{3}(:,:,4))