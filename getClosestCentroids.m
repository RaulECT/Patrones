function indices = getClosestCentroids(X, centroids)
    K = size(centroids, 1);
    indices = zeros( size(X,1),1 );
        
        for i=1:size(X,1)
            temp = X(i,:);
            [~,indices(i,1)] = min(sum(((bsxfun(@minus,temp,centroids)).^2),2));
        end
end