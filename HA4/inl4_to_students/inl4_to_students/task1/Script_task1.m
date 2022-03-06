clear all;
close all;
clc;

%%1. make the colors more vivid
img_1 = imread('arcimboldo_low.jpg');
%img_1 = double(img_1)/255;
figure;
imagesc(img_1);
title("Original image - 1 ");

%convert the RGB image to HSV
hsv = rgb2hsv(img_1);
%multiply the s channel with a factor
%hsv(:,:,2) = 10*hsv(:,:,2); %too much saturation
%hsv(:,:,2) = 7*hsv(:,:,2); %a little oversaturated
hsv_init = hsv(:,:,2);
hsv(:,:,2) = histeq(hsv(:,:,2)); %good
%hsv(:,:,2) = 5*hsv(:,:,2); %also good
%convert the image back to RGB
img_1_new = hsv2rgb(hsv);

figure;
subplot(1,2,1), histogram(hsv_init);
title("Original image - histogram");
subplot(1,2,2), histogram(hsv(:,:,2));
title("Modified image - histogram");

figure;
subplot(1,2,1), imagesc(img_1);
title("Original image");
subplot(1,2,2), imagesc(img_1_new);
title("Modified image");

%%2. automatically white balance the image
img_2 = imread('michelangelo_shift.jpg');
figure;
imagesc(img_2);
title("Original image - 2");


grayImage = rgb2gray(img_2); % convert from RGB to gray image
mean_red = mean2(img_2(:, :, 1)); %red channel
mean_green = mean2(img_2(:, :, 2)); %green channel
mean_blue = mean2(img_2(:, :, 3)); %blue channel
mean_gray = mean2(grayImage); 
%equalise the mean for all channels
red = uint8(double(img_2(:, :, 1)) * mean_gray / mean_red);
green = uint8(double(img_2(:, :, 2)) * mean_gray / mean_green);
blue = uint8(double(img_2(:, :, 3)) * mean_gray / mean_blue);
%balanced image
img2_new = cat(3, red, green, blue);


figure;
subplot(2,1,1), imagesc(img_2);
title("Original image");
subplot(2,1,2), imagesc(img2_new);
title("Modified image");

%%gray_world
%https://www.mathworks.com/help/images/comparison-of-auto-white-balance-algorithms.html
dim = size(img_2,3)

for i = 1:dim
    scale = sum(sum(img_2(:,:,i)))/numel(img_2(:,:,i));
    %img_2_out(:,:,i) = img_2(:,:,i)*(250/scale); %too white
    img_2_out(:,:,i) = img_2(:,:,i)*(200/scale); %still too white, but better
    %img_2_out(:,:,i) = img_2(:,:,i)*(155/scale); %good
end

figure;
subplot(2,1,1), imagesc(img_2);
title("Original image");
subplot(2,1,2), imagesc(img_2_out);
title("Modified image - method 2");