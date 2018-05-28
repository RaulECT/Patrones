warning off
close all
clear all

% DEFINICION DE VARIABLES
Fs = 44100;
order = 12;

foldersPath = ["A/A", "E/E", "I/I", "O/O", "U/U"];
audioFormat = ".wav";
vowels = 5;
samplesPerVowel = 25;
totalSamples = vowels * samplesPerVowel;
characteristics = zeros(totalSamples, 2);
n=1;

% LEER ELEMENTOS DE ENTRENAMIENTO
for i=1:vowels
    folder = foldersPath(i);
    
    for j=1:samplesPerVowel
        audioName = strcat(folder, string(j));
        audioPath = strcat(audioName, audioFormat);
        [y,Fs] = audioread(audioPath);
        
        % OBTENER LOS DESCRIPTORES DE LOS AUDIOS
        [pxx,f] = pyulear(y,order);
        freq = meanfreq(pxx, f);
        variance = var(pxx);
        meanpeaks = mean(findpeaks(pxx));
        varpeaks = var(findpeaks(y));
        
        characteristics(n,1) = freq;
        characteristics(n,2) = meanpeaks;
        
        n = n + 1;
    end
end

%DEFINICIÓN SOM
net = selforgmap([5 5]);
net.trainParam.epochs = 1000;

%ENTRENAMIENTO|11
net = train(net,characteristics');

%CLASIFICAR DATOS CON RED ENTRENADA
y = net(characteristics');
classes = vec2ind(y);

% TEST CLASIFICACION
testA = zeros(25, 2);
aFolder = "U/U";
for i=1:25
    aAudioN = strcat(aFolder,string(i));
    aAudio = strcat(aAudioN, ".wav");
    [y,Fs] = audioread(aAudio);
    
    [pxx,f] = pyulear(y,order);
    freq = meanfreq(pxx, f);
    variance = var(pxx);
    meanpeaks = mean(findpeaks(pxx));
    varpeaks = var(findpeaks(y));
    
    testA(i,1) = freq;
    testA(i,2) = meanpeaks;
end

y2 = net(testA');
classes2 = vec2ind(y2);

% PRUEBA DE EJECUCIÓN
%Fs = 11025;
%nBits = 24;
%nCanales = 1;
%tiempo = 4; %tiempo de registro
des = zeros(1, 2);

%recObj = audiorecorder(Fs, nBits, nCanales);
%    disp('Start recording')
%        recordblocking(recObj, tiempo);
%    disp('Stop recording');
    
    
%y = getaudiodata(recObj);
[y,Fs] = audioread("I/I10.wav");
[pxx,f] = pyulear(y,order);
freq = meanfreq(pxx, f);
variance = var(pxx);
meanpeaks = mean(findpeaks(pxx));
varpeaks = var(findpeaks(y));

des(1, 1) = freq;
des(1, 2) = meanpeaks;

y3 = net(des');
classes3 = vec2ind(y3);

switch(classes3(1,1))
    case {3, 6, 7, 11, 16, 21, 22}
        disp('A');
        %classes3(i, 1) = 1;
    case {2, 8, 12}
        disp('E');
        %classes3(i, 1) = 2;
    case {1, 5, 15}
        disp('I');
        %classes3(i, 1) = 3;
    case {13, 14, 19, 23, 25}
        disp('O');
        %classes3(i, 1) = 4;
    case {4, 9, 10}
        disp('U');
        %classes3(i, 1) = 5;
end
