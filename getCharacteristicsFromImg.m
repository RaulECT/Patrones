function [characteristics, N, M, n, L] = getCharacteristicsFromImg( imgName )
    % Lectura de la imagen de entrenamiento
    I = imread( imgName );
    %figure(1)
    %imshow(I,[]);
    [N,M] = size(I);
    
    % Segmentacion de la imagen
    J =not(I(:,:,1)>192);
    J = bwareaopen(J,5,4); % remueve regiones muy pequenhas
    [L,n] = bwlabel(J,4);
    %figure(2)
    %imshow(L,[]);
    
    % Extraccion de Caracteristicas
    stats = regionprops(L,'all');
    characteristics = zeros(n, 2);
    
    for i = 1:n
        %disp(sprintf('%3d) EjeMayor=%6.2f EjeMenor = %6.2fd Area =%5d',i,stats(i).MajorAxisLength,stats(i).MinorAxisLength,stats(i).Area));
        %figure(3)
        %imshow(L==i)
    
        characteristics(i, 1) = stats(i).MinorAxisLength / stats(i).MajorAxisLength;
        characteristics(i, 2) = stats(i).Eccentricity;
    
        %TY(i) = input('Ingrese 1 si es A, 2 si es E, 3 si es I, 4 si es O, 5 si U (A=1 E=2 I=3 O=4 U=5)?');
    end
end