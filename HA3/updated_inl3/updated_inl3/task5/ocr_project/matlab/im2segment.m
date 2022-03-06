% REPLACE WITH YOUR FUNCTION FROM PREVIOUS ASSIGNMENTS!
function S = im2segment(im)

    fbild = uint8(im);
    H = fspecial('gaussian'); %gaussian filter
    filteredImg = uint8(imfilter(fbild,H));

    level = round(mean(mean(filteredImg)));
    %level = 43;
    m = size(im,1);
    n = size(im,2);
    new_image = zeros(m,n);
    new_image = filteredImg>level;
    CC = bwconncomp(new_image,8);
    L = labelmatrix(CC);
    T = regionprops(CC,'Area');
    P = 20;
    findN = find([T.Area]>P);
    NoSeg = length(findN);
    S = cell(1,NoSeg);

    for i=1:NoSeg
        S{i} = ismember(L,findN(i));
    end

end