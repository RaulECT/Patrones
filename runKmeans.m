%clear all
%close;
%clc
%X = [0.632855310299004 0.774270079640400
%    0.632414676221965 0.774630026076364
%    0.636729033849003 0.771087632797800
%    0.634494391221004 0.772927465878324];

% Initialize database here
%K = 4;
%max_iterations = 100;
%centroids = initCentroids(X, K);

%for i=1:max_iterations
%   indices = getClosestCentroids(X, centroids);
%   centroids = computeCentroids(X, indices, K);
%end

function [centroids, indices] = runKmeans( X, K, max_iterations )
    centroids = initCentroids(X, K);

    for i=1:max_iterations
        indices = getClosestCentroids(X, centroids);
        centroids = computeCentroids(X, indices, K);
    end
end
