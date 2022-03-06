function Theta = segment_image (I,mu0,mu1,std1,std0,lambda )
    [M,N] = size(I);
    img = I;
    n = M*N; % Number of image pixels
    
    %get the neighbours and make the adjacency matrix A
    Neighbors = edges4connected(M,N);
    i= Neighbors(: ,1);
    j= Neighbors(: ,2);
    A = lambda*sparse(i,j,1,n,n);

    %compute the negative log likelihoods
    neg_log_background = 0.5*log(2*pi*std0^2) + 0.5*(((img - mu0).^2)/(std0^2));
    neg_log_chamber = 0.5*log(2*pi*std1^2) + 0.5*(((img - mu1).^2)/(std1^2));

    figure;
    subplot(1,2,1),imshow(neg_log_background);
    title("Negative log - background")
    subplot(1,2,2),imshow(neg_log_chamber);
    title("Negative log - chamber")
    
    %T = [ (img(:) - mu1 ).^2 (img(:) - mu0 ).^2];
    %data term 
    T = [neg_log_chamber(:), neg_log_background(:)];
    %T = [ (img(:) - mu1 ).^2 (img(:) - mu0 ).^2];
    T = sparse(T);
    
    
    %solve using min-cut algorithm
    [E,Theta] = maxflow(A,T);
    Theta = reshape(Theta,M,N);
    Theta = double(Theta);
end

