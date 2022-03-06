% REPLACE WITH YOUR FUNCTION FROM PREVIOUS ASSIGNMENTS!
function features = segment2features(I)
    %image having the same size as the bounding box of the region
    digit_Img = regionprops(I,'all').Image;
    % resize to standard size
    digit_Img = imresize(digit_Img, [20, 20]);
    %extract the size of the image, so they can be used for normalization
    [m,n] = size(digit_Img);

    %extract features
    holes = bwconncomp(~I);          
    holes_no = holes.NumObjects - 1;

    props = regionprops(digit_Img, 'all');

    C = props.Centroid;
    Cx = C(1);
    Cy = C(2);
    Circ = props.Circularity;
    P = props.Perimeter;
    A = props.Area;
    EN = props.EulerNumber;
    E = props.Eccentricity;
    A = props.Area;
    se = strel('sphere',5);
    I_filled = imdilate(digit_Img, se);
    [m2,n2] = size(I_filled);
    props_filled = regionprops(I_filled, 'all');
    A_filled = props_filled.Area;
    diff_filled = A_filled/(m2*n2) - A/(m*n);
    O = props.Orientation;
    
    features = [O/180, diff_filled, E, P/(m*n), EN, Circ, Cx/n, Cy/m, holes_no/2];
end