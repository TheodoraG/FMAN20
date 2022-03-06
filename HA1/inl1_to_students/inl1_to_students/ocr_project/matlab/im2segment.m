
function S = im2segment(im)

    fbild = uint8(im);
    H = fspecial('gaussian'); %gaussian filter
    filteredImg = imfilter(fbild,H);

    level = round(mean(mean(filteredImg)));
    %level = 43;
    m = size(im,1);
    n = size(im,2);
    new_image = zeros(m,n);
    new_image = filteredImg>level;
    %new_image = bwmorph(new_image,'spur');
    CC = bwconncomp(new_image,8)
    L = labelmatrix(CC);
    T = regionprops(CC,'Area')
    P=20;
    findN = find([T.Area]>P);
    NoSeg = length(findN)
    %nrofsegments = 5; % could vary, probably you should estimate this
    S = cell(1,NoSeg);

    for i=1:NoSeg
        S{i} = ismember(L,findN(i));
    end
    %count = 28; %index for selecting only a digit (140:5=28)
    %start = 1;  
    %for kk = 1:nrofsegments
        %filter the image with a gaussian filter
        %in order to reduce noise
        %H = fspecial('gaussian'); %gaussian filter
        %filteredImg = imfilter(im,H);
        %construct a new black image
        %new_image = zeros(m,n);
        %do the segmentation for only a digit - only 28 columns
        %inspecting the input image bild, it can be observed that
        %the contour of the digit has values higher than 40
        %therefore the chosen threshold is 43
        %new_image(:,start:count) = filteredImg(:,start:count)>43;
        %S{kk} = new_image;
        %increment the start and stop indexes
        %in order to go to the next digit
        %start = start+28;
        %count = count+28;    
    %end



