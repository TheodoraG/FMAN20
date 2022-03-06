function features = segment2features(I)
% features = segment2features(I)
    [m,n] = size(I);
    CC =  bwconncomp(I,8);
    % Number of holes
    holes = bwconncomp(~I);
    nbr_holes = holes.NumObjects -1;
    A = regionprops(CC,'Area');
    P = regionprops(CC,'Perimeter');
    EN = regionprops(CC,'EulerNumber');
    C = regionprops(CC, 'Centroid');
    edges = edge(I,'canny'); %%good
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
    E = regionprops(CC, 'Eccentricity');
    features = [A.Area/(m*n) P.Perimeter/(m*n) EN.EulerNumber C.Centroid(1)/n C.Centroid(2)/m E.Eccentricity nbr_holes];
    %features = randn(6,1); % not a very useful feature vector...