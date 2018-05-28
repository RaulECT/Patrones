% OBTENER LAS CARACTERISTICAS DE LAS IMAGENES DE ENTRENAMIENTO

% BOLD
charAB = getCharacteristics('TAB.png');
charEB = getCharacteristics('TEB.png');
charIB = getCharacteristics('TIB.png');
charOB = getCharacteristics('TOB.png');
charUB = getCharacteristics('TUB.png');

% REGULAR
charAR = getCharacteristics('TAR.png');
charER = getCharacteristics('TER.png');
charIR = getCharacteristics('TIR.png');
charOR = getCharacteristics('TOR.png');
charUR = getCharacteristics('TUR.png');

% ITALIC
charAI = getCharacteristics('TAI.png');
charEI = getCharacteristics('TEI.png');
charII = getCharacteristics('TII.png');
charOI = getCharacteristics('TOI.png');
charUI = getCharacteristics('TUI.png');

characteristics = cat(1,charAB, charEB, charIB, charOB, charUB,charAR, charER, charIR, charOR, charUR, charAI, charEI, charII, charOI, charUI );

net = selforgmap([5,2]);
net.trainParam.epochs = 1000;
net = train(net,characteristics');
    
y = net(characteristics');
classes = vec2ind(y);

% PROBAR SISTEMA
I2C = imread('val_1.jpg');
I2 = rgb2gray(I2C);
[N2,M2] = size(I2);

J2 =not(I2 >192);
J2 = bwareaopen(J2,5,8); % remueve regiones muy pequenhas
[L2,n2] = bwlabel(J2, 4);


stats2 = regionprops(L2,'all');
characteristics2 = zeros(n2, 2);

for i = 1:n2
    characteristics2(i, 1) = stats2(i).MinorAxisLength / stats2(i).MajorAxisLength;
    characteristics2(i, 2) = stats2(i).Eccentricity;
end

y2 = net(characteristics2');
classes2 = vec2ind(y2);

A = zeros(N2,M2);
O = zeros(N2,M2);


for i = 1:n2
    %itsA = classes2(1, i) == 3 || classes2(1, i) == 7;
    %itsE = classes2(1, i) == 9 || classes2(1, i) == 15;
    %itsI = classes2(1, i) == 5 || classes2(1, i) == 9;
    %itsO = classes2(1, i) == 1 || classes2(1, i) == 2;
    %itsU = classes2(1, i) == 6;
    
    %itsA = classes2(1, i) == 2 || classes2(1, i) == 3 || classes2(1, i) == 12 || classes2(1, i) == 6 || classes2(1, i) == 11 || classes2(1, i) == 7 || classes2(1, i) == 13 || classes2(1, i) == 14;
    %itsE = classes2(1, i) == 4 || classes2(1, i) == 7 || classes2(1, i) == 13 || classes2(1, i) == 14;
    %itsI = classes2(1, i) == 5 || classes2(1, i) == 9 || classes2(1, i) == 10 || classes2(1, i) == 15;
    %itsO = classes2(1, i) == 1 || classes2(1, i) == 2 || classes2(1, i) == 3 || classes2(1, i) == 6 || classes2(1, i) == 11 || classes2(1, i) == 7 || classes2(1, i) == 13;
    %itsU = classes2(1, i) == 1 || classes2(1, i) == 2 || classes2(1, i) == 3 || classes2(1, i) == 6 || classes2(1, i) == 7 || classes2(1, i) == 12 || classes2(1, i) == 11 || classes2(1, i) == 13;
    
    itsA = classes2(1, i) == 2 || classes2(1, i) == 7;
    itsE = classes2(1, i) == 3 || classes2(1, i) == 4 || classes2(1, i) == 8;
    itsI = classes2(1, i) == 5 || classes2(1, i) == 9 || classes2(1, i) == 10;
    itsO = classes2(1, i) == 1 || classes2(1, i) == 6 || classes2(1, i) == 7;
    itsU = classes2(1, i) == 1 || classes2(1, i) == 2 || classes2(1, i) == 6 || classes2(1, i) == 7;
    
    if( itsA )
      A(stats2(i).PixelIdxList) = ones(stats2(i).Area,1); 
    else
      O(stats2(i).PixelIdxList) = ones(stats2(i).Area,1);
    end
        
end

figure(3)
imshow([A;ones(30,M2);O],[])