
% Reconocimiento de Patrones
% Realizar un clasificador que separe los caracteres A-E-I-O-U.
% Imagen de entrenamiento   train.jpg
% Imagen de prueba:         test.jpg 
%                          
%
%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        % 
% ENTRENAMIENTO          %
%                        % 
%%%%%%%%%%%%%%%%%%%%%%%%%%
warning off
close all
%clear all

[ net, t, d ] = imageTrain();

%%%%%%%%%%%%%%%%%%%%%%%%%%
%                        % 
% TEST          %
%                        % 
%%%%%%%%%%%%%%%%%%%%%%%%%%

% READ IMAGE
disp('Parte 2: Test (presione enter)');
pause

% GET CHARACTERISTICS
[ characteristics, N, M, n, L ] = getCharacteristicsFromImg( 'test_3.jpg' );

% USE NEURONAL NETWORK
classes = classify( characteristics', net );

correctsA = showAVowels(n, L, classes, N, M);
correctsE = showEVowels(n, L, classes, N, M);
correctsI = showIVowels(n, L, classes, N, M);
correctsO = showOVowels(n, L, classes, N, M);
correctsU = showUVowels(n, L, classes, N, M);

