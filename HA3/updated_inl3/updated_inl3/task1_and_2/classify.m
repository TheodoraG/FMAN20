function y = classify(x, classification_data)
% 1 KNN implementation
    [m,n] = size(classification_data);
    [mx,nx] = size(x);
    dist_sum = ones(1,n);
    %for each column in the classification data
    %and each column in x
    %compute the euclidian distance between the x values
    for i = 1:n
        sum = 0;
        for j = 1:mx
            %euclidian distance
            dist = sqrt((x(j,1)-classification_data(j,i))^2);
            %sum the distances 
            sum = sum + dist;
        end
        %construct the array with the sum of distances
        %it will have the same number of columns as the classification data
        dist_sum(1,i) = sum;
    end
    %sort the array with the sum of distances
    [min_dist,index] = sort(dist_sum,'ascend');
    %use KNN wth only one neighbour
    k = 1;
    %extract the index of the mnmal value
    index = index(1:k);
    %select the corresponding result for the index
    y_coresp = classification_data(m,index);
    y= y_coresp;
end

