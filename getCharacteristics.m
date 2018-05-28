function characteristics = getCharacteristics( imgName )
    % LECTURA DE LA IMAGEN
    I = imread(imgName);
    
    % SEGMENTACION DE LA IMAGEN
    J =not(I(:,:,1)>192);
    J = bwareaopen(J,5,4); % remueve regiones muy pequenhas
    [L,n] = bwlabel(J,4);
    
    stats = regionprops(L,'all');
    %characteristics = zeros(n, 3);
    characteristics = zeros(n, 2);
    
    % OBTENER LOS 3 DESCRIPTORES DE LA IMAGEN
    for i = 1:n
        characteristics(i, 1) = stats(i).MinorAxisLength / stats(i).MajorAxisLength;
        characteristics(i, 2) = stats(i).Eccentricity;
        %characteristics(i, 3) = stats(i).Extent;
    end
end