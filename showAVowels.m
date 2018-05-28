function correctVowels = showAVowels( size, imageSegments, elementsClasified, N, M )
    
    stats = regionprops(imageSegments,'all');
    
    A = zeros(N,M);
    O = zeros(N,M);
    
    for i = 1:size
        if( elementsClasified(1, i) == 3 )
            A(stats(i).PixelIdxList) = ones(stats(i).Area,1);
        else
            O(stats(i).PixelIdxList) = ones(stats(i).Area,1);
        end
        
        figure(3)
        imshow([A;ones(30,M);O],[])
    end
    
    correctVowels = input('Cuantas A fueron clasificadas correctamente?');
end