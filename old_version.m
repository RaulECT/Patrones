
% Reconocimiento de Patrones
% Realizar un clasificador que separe los caracteres A-E-I-O-U.
% Imagen de entrenamiento   train.jpg
% Imagen de prueba:         test.jpg 
%                          
%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        % 
% PARTE 1: ENTRENAMIENTO %
%                        % 
%%%%%%%%%%%%%%%%%%%%%%%%%%
warning off
close all
clear all

disp('Parte 1: Entrenamiento (presione enter)');
pause

% Lectura de la imagen de entrenamiento
I = imread('test.png');
figure(1)
imshow(I,[]);
[N,M] = size(I);

% Segmentacion de la imagen
J =not(I(:,:,1)>192);
J = bwareaopen(J,5,4); % remueve regiones muy pequenhas
[L,n] = bwlabel(J,4);
figure(2)
imshow(L,[]);

% Extraccion de Caracteristicas
stats = regionprops(L,'all');
TY = zeros(n,1);
characteristics = zeros(n, 2);
for i = 1:n
    disp(sprintf('%3d) EjeMayor=%6.2f EjeMenor = %6.2fd Area =%5d',i,stats(i).MajorAxisLength,stats(i).MinorAxisLength,stats(i).Area));
    figure(3)
    imshow(L==i)
    
    characteristics(i, 1) = stats(i).MinorAxisLength / stats(i).MajorAxisLength;
    characteristics(i, 2) = stats(i).Eccentricity;
    
    TY(i) = input('Ingrese 1 si es A, 2 si es E, 3 si es I, 4 si es O, 5 si U (A=1 E=2 I=3 O=4 U=5)?');
end

% Seleccion de Caracteristicas (manual)
area  = [stats.Area]';
exentricidad = [stats.Eccentricity]';
axis1 = [stats.MajorAxisLength]';
axis0 = [stats.MinorAxisLength]';
euler = [stats.EulerNumber]';
axisR = axis0./axis1;
equivDi = [stats.EquivDiameter]';
convexA = [stats.ConvexArea]';
fill = [stats.FilledArea]';
per = [stats.Perimeter]';
solidity = [stats.Solidity]';
extent = [stats.Extent]';
sol = [stats.Solidity]';
ori = [stats.Orientation]';
bound = [stats.BoundingBox]';
compacidad = ((per).^2)'./area;

iA = find(TY==1);
iE = find(TY==2);
iI = find(TY==3);
iO = find(TY==4);
iU = find(TY==5);

% Grafica del espacio de caracteristicas 
figure(4)
clf
plot(exentricidad(iA), axisR(iA),'rx')
hold on
plot(exentricidad(iE), axisR(iE),'k*')
hold on
plot(exentricidad(iI), axisR(iI),'bx')
hold on
plot(exentricidad(iO), axisR(iO),'g*')
hold on
plot(exentricidad(iU), axisR(iU),'mx')
hold on
xlabel('exentricidad');
ylabel('Razón de ejes')
legend('A','E','I','O','U')


% Conclusion del espacio de caracteristicas
disp('el area no es una buena caracteristica')
disp('la razon de ejes si es una buena caracteristica')

% Clasificador por umbral
% punto medio de los centros de masa

%[centroids, idx] = runKmeans( characteristics, 5, 100 );
%[t, clasified] = clasifyBySOM( characteristics', 2000, [5 1] );

%correctsA = showAVowels(n, L, clasified, N, M);
%correctsE = showEVowels(n, L, clasified, N, M);
%correctsI = showIVowels(n, L, clasified, N, M);
%correctsO = showOVowels(n, L, clasified, N, M);
%correctsU = showUVowels(n, L, clasified, N, M);

%plot(centroids,[0 5000],'g:')