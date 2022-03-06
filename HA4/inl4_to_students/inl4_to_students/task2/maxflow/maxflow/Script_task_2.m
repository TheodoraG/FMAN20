clear all;
close all;
clc;

load heart_data.mat

img = im;
figure;
colormap(gray);
imagesc(img);
title("Original image");

[M,N] = size(img);
n = M*N; % Number of image pixels

%%2.1 estimate the means & thr std for the chamber class
%and background class
mean_chamber_cls = mean(chamber_values)
std_chamber_cls = std(chamber_values)
mean_background_cls = mean(background_values)
std_background_cls = std(background_values)

%%2.2
mu0 = mean_background_cls;
mu1 = mean_chamber_cls;
lambda = 8;

Neighbors = edges4connected(M,N);
i= Neighbors(: ,1);
j= Neighbors(: ,2);
A = lambda*sparse(i,j ,1,n,n);

%negative log likelihoods
neg_log_background = 0.5*log(2*pi*std_background_cls^2) + 0.5*(((img - mu0).^2)/(std_background_cls^2));
neg_log_chamber = 0.5*log(2*pi*std_chamber_cls^2) + 0.5*(((img - mu1).^2)/(std_chamber_cls^2));

figure;
colormap(gray);
imagesc(neg_log_background);

figure;
colormap(gray);
imagesc(neg_log_chamber);

%T = [ (img(:) - mu1 ).^2 (img(:) - mu0 ).^2];
T = [neg_log_chamber(:) neg_log_background(:)];
%T = [ (img(:) - mu1 ).^2 (img(:) - mu0 ).^2];
T = sparse(T);

%tic
[E,Theta] = maxflow(A,T);
Theta = reshape(Theta,M,N);
Theta = double(Theta);
%toc
%hold on;
figure;
%colormap(gray);
imshow(Theta);