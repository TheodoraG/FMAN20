% REPLACE WITH YOUR FUNCTION FROM PREVIOUS ASSIGNMENTS!
function features = segment2features(I)
    CC =  bwconncomp(I,8);
    if CC.NumObjects >1
        se = strel('disk',10);
        I = imclose(I,se);
        CC =  bwconncomp(I,8);
    end
    %im = imbinarize(I);
    [row, col] = find(I==1);
    BW = I(min(row):max(row),min(col):max(col));
    [m,n]=size(I);
    holes = bwconncomp(~I);
    holes_no = holes.NumObjects -1;
    A = regionprops(CC,'Area');
    P = regionprops(CC,'Perimeter');
    EN = regionprops(CC,'EulerNumber');
    C = regionprops(CC, 'Centroid');
    E = regionprops(CC, 'Eccentricity');
    edges = edge(I,'canny');
    countEdges = nnz(edges); %number of nonzero matrix elements
    se = strel('sphere',5);
    I_filled = imdilate(I, se);
    [m2,n2] = size(I_filled);
    CC_filled =  bwconncomp(I_filled,8);
    A_filled = regionprops(CC_filled,'Area');
    diff_filled = A_filled.Area/(m2*n2) - A.Area/(m*n);
    corneres = detectHarrisFeatures(I);
    noCorners = length(corneres);
    MajA = regionprops(CC,'MajorAxisLength');
    MinA = regionprops(CC,'MinorAxisLength');
    
    features = [A.Area/(m*n) P.Perimeter/(m*n) EN.EulerNumber C.Centroid(1)/n C.Centroid(2)/m diff_filled countEdges noCorners E.Eccentricity MajA.MajorAxisLength MinA.MinorAxisLength holes_no];

end