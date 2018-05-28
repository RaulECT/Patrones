function correctVowels = showUVowels( size, imageSegments, elementsClasified, N, M )
 stats = regionprops(imageSegments,'all');
    
    U = zeros(N,M);
    O = zeros(N,M);
    
    for i = 1:size
        if( elementsClasified(1, i) == 2 )
            U(stats(i).PixelIdxList) = ones(stats(i).Area,1);
        else
            O(stats(i).PixelIdxList) = ones(stats(i).Area,1);
        end
        
        figure(4)
        imshow([U;ones(30,M);O],[])
    end
    
    correctVowels = input('Cuantas U fueron clasificadas correctamente?');
end