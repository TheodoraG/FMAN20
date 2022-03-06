% REPLACE WITH YOUR OWN FUNCTION
function y = features2class(x, classification_data)
% IMPLEMENT YOUR CHOSEN MACHINE LEARNING CLASSIFIER HERE
    [m,n] = size(classification_data);
    [mx,nx] = size(x);
    dist_sum = ones(1,n);
    for i = 1:n
        sum = 0;
        for j = 1:mx
            dist = sqrt((x(j,1)-classification_data(j,i))^2);
            sum = sum + dist;
        end
        dist_sum(1,i) = sum;
    end
    [min_dist,index] = sort(dist_sum,'ascend');
    k = 1;
    index = index(1:k);
    y_coresp = classification_data(m,index);
    y= y_coresp;
end
