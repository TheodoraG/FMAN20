clear all;
close all;
clc;

load heart_data.mat

%input image
I = im;

%%2.1
%compute mean and stardat deviation for each class
mean_chamber_cls = mean(chamber_values)
std_chamber_cls = std(chamber_values)
mean_background_cls = mean(background_values)
std_background_cls = std(background_values)

%%2.2
%initialize mu0, mu1 and put a proper value for lambda
mu0 = mean_background_cls;
std0 = std_background_cls;
mu1 = mean_chamber_cls;
std1 = std_chamber_cls;
lambda = 7;

%function that does the segmentation using graph-cut
Theta = segment_image(I,mu0,mu1,std1,std0,lambda);
figure;
subplot(1,2,1),imshow(I);
title("Original image")
subplot(1,2,2),imshow(Theta);
title("Segmented image")

