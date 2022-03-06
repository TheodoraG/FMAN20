% REPLACE WITH YOUR FUNCTION FROM PREVIOUS ASSIGNMENTS!
function S = im2segment(im)
    H = fspecial('gaussian'); % gaussian filter
    im = imfilter(im, H);

    level = 43;
    im = im > level; % threshold for binarization
    
    im= bwmorph(im,'fill'); %fill isolated interior pixels
    se =  strel('square', 1);
    im = imdilate(im, se); % dilation
    im = bwpropfilt(im,'perimeter',5); %keep only the 5 objects with the largest perimeter
    im = imerode(im, se); % erosion
    im= bwmorph(im,'fill'); %fill isolated interior pixels
    
    [L, num] = bwlabel(im);% extract the labels and the numbers of 8 connected components
    noSegments = num;    % number of segments
    
    m = size(im,1);
    n = size(im,2);
    
    S = cell(1,noSegments); %array cell with segments.
    for i = 1:noSegments        
        segment = zeros(m,n);
        segment(i == L) = 1;
        S{i}= segment;
    end
end
