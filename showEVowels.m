function correctVowels = showEVowels( size, imageSegments, elementsClasified, N, M )
 stats = regionprops(imageSegments,'all');
    
    E = zeros(N,M);
    O = zeros(N,M);
    
    for i = 1:size
        if( elementsClasified(1, i) == 4 )
            E(stats(i).PixelIdxList) = ones(stats(i).Area,1);
        else
            O(stats(i).PixelIdxList) = ones(stats(i).Area,1);
        end
        
        figure(4)
        imshow([E;ones(30,M);O],[])
    end
    
    correctVowels = input('Cuantas E fueron clasificadas correctamente?');
end