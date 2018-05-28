function centroids = computeCentroids( X, indices, K )
    % computeNewCentroids computes the new centroids of each cluster based on
    % the mean value of the all the points belonging to that cluster.

    % Initialize variables
    [m n] = size(X);
    centroids = zeros(K, n);

    for i=1:K
        temp = find(indices==i);
        Xtemp = X(temp,:); % Get all points belonging to that cluster
        centroids(i,:) = (sum(Xtemp,1))./length(Xtemp); % Assign new centroid based on mean
    end
end