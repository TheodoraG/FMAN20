clear all;
close all;
clc;

datadir = '../datasets/short1'; % change or check so that you are in the right directory

a = dir(datadir);

file = 'im2';

fnamebild = [datadir filesep file '.jpg'];
fnamefacit = [datadir filesep file '.txt'];

bild = imread(fnamebild);
fid = fopen(fnamefacit);
facit = fgetl(fid);
fclose(fid);

S = im2segment(bild);
B = S{4};
x = segment2features(B)

% se = strel('disk',3);
% B2 = imclose(B,se);
 figure(1); colormap(gray);
%   imagesc(S{k});
 imshow(B);
 
 
S2 = im2segment(bild);
B2 = S{5};
x2 = segment2features(B2)

% se = strel('disk',3);
% B2 = imclose(B,se);
 figure(2); colormap(gray);
%   imagesc(S{k});
 imshow(B2);



