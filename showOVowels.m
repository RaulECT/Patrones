function correctVowels = showOVowels( size, imageSegments, elementsClasified, N, M )
 stats = regionprops(imageSegments,'all');
    
    O = zeros(N,M);
    OT = zeros(N,M);
    
    for i = 1:size
        if( elementsClasified(1, i) == 1 )
            O(stats(i).PixelIdxList) = ones(stats(i).Area,1);
        else
            OT(stats(i).PixelIdxList) = ones(stats(i).Area,1);
        end
        
        figure(4)
        imshow([O;ones(30,M);OT],[])
    end
    
    correctVowels = input('Cuantas O fueron clasificadas correctamente?');
end