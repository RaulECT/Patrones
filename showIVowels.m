function correctVowels = showIVowels( size, imageSegments, elementsClasified, N, M )
 stats = regionprops(imageSegments,'all');
    
    I = zeros(N,M);
    O = zeros(N,M);
    
    for i = 1:size
        if( elementsClasified(1, i) == 5 )
            I(stats(i).PixelIdxList) = ones(stats(i).Area,1);
        else
            O(stats(i).PixelIdxList) = ones(stats(i).Area,1);
        end
        
        figure(4)
        imshow([I;ones(30,M);O],[])
    end
    
    correctVowels = input('Cuantas I fueron clasificadas correctamente?');
end