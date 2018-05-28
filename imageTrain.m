function [net, t, d] = imageTrain
    disp('Parte 1: Entrenamiento (presione enter)');
    pause

    [ characteristics, N, M, n, L ] = getCharacteristicsFromImg( 'test.png' );

    [t, clasified, net] = clasifyBySOM( characteristics', 2000, [5 1] );

    %correctsA = showAVowels(n, L, clasified, N, M);
    %correctsE = showEVowels(n, L, clasified, N, M);
    %correctsI = showIVowels(n, L, clasified, N, M);
    %correctsO = showOVowels(n, L, clasified, N, M);
    %correctsU = showUVowels(n, L, clasified, N, M);
    
    %d = ( correctsA + correctsE + correctsI + correctsO + correctsU );
    d = 12;
end