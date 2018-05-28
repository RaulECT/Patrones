order = 12;
Fs = 44100;

folderArray = ['A', 'E', 'I', 'O', 'U'];
strFormat = '.wav';
elements = 5;
samplesPerElement = 25;
features = 2;
totalSamples = elements * samplesPerElement;
matrix = zeros(totalSamples,features);
n=1;

for i=1:elements
    strFolder = folderArray(i);
    switch(strFolder)
        case 'A'
            strFolder = 'A/A';
        case 'E'
            strFolder = 'E/E';
        case 'I'
            strFolder = 'I/I';
        case 'O'
            strFolder = 'O/O';
        case 'U'
            strFolder = 'U/U';
    end
    
    for j=1:samplesPerElement
        strPath = strcat(strFolder,string(j));
        strFilePath = strcat(strPath,strFormat);
        [y,fs] = audioread(strFilePath);
        [pxx,f] = pyulear(y,order);
        freq = meanfreq(pxx, f);
        variance = var(pxx);
        meanpeaks = mean(findpeaks(pxx));
        varpeaks = var(findpeaks(y));
        matrix(n,1) = freq;
        %matrix(n,2) = variance;
        %matrix(n,3) = meanpeaks;
        matrix(n,2) = varpeaks;
        n = n + 1;
    end
end
matrix = matrix';
plot(matrix(1,:), matrix(2,:), '*r')
%plot(matrix(1,:), matrix(2,:), '*r')
%plot(matrix(1,:), '*r')

%DEFINICIÓN SOM
net = selforgmap([5 5]);
net.trainParam.epochs = 200;

%ENTRENAMIENTO|11
net = train(net,matrix);

%CLASIFICAR DATOS CON RED ENTRENADA
y = net(matrix);
classes = vec2ind(y);

%CLASIFICACIÓN CON NUEVOS DATOS
% recObj = audiorecorder(fs, 16, 1);
% disp('Start speaking.');
% record(recObj);
% pause(3);
% stop(recObj);
% disp('End of Recording.');
% data = getaudiodata(recObj);
% [pxx,f] = pyulear(data,order);
% freq = meanfreq(pxx, f);
% %variance = var(pxx);
% meanpeaks = mean(findpeaks(pxx));
% 
% test = zeros(1,2);
% test(1,1) = freq;
% %test(1,2) = variance;
% test(1,2) = meanpeaks;
% Q = test';
% w = net(Q);
% classes2 = vec2ind(w);

%CLASIFICACIÓN CON DATOS DE PRUEBA
test = zeros(25,2);
n = 1;
result = zeros(25,1);
samplesPerElement = 10;
for i=1:elements
    strFolder = folderArray(i);
    switch(strFolder)
        case 'A'
            strFolder = 'prueba/A';
        case 'E'
            strFolder = 'prueba/E';
        case 'I'
            strFolder = 'prueba/I';
        case 'O'
            strFolder = 'prueba/O';
        case 'U'
            strFolder = 'prueba/U';
    end
    for j=1:samplesPerElement
        strPath = strcat(strFolder,string(j));
        strFilePath = strcat(strPath,strFormat);
        [y,fs] = audioread(strFilePath);
        [pxx,f] = pyulear(y,order);
        freq = meanfreq(pxx, f);
        variance = var(pxx);
        meanpeaks = mean(findpeaks(pxx));
        varpeaks = var(findpeaks(y));
        test(n,1) = freq;
        %test(n,2) = variance;
        %test(n,3) = meanpeaks;
        test(n,2) = varpeaks;
        n = n + 1;
    end
end

Q = test';
w = net(Q);
classes2 = vec2ind(w);
number = 50;
for i=1:number
    switch(classes2(1,i))
    case {2, 11, 12, 17, 22}
        disp('A');
        result(i, 1) = 1;
    case {1, 6, 7, 16, 18}
        disp('E');
        result(i, 1) = 2;
    case {21, 25}
        disp('I');
        result(i, 1) = 3;
    case {3, 8, 13, 14, 20, 23}
        disp('O');
        result(i, 1) = 4;
    case {4, 5, 9, 10, 15, 19, 24}
        disp('U');
        result(i, 1) = 5;
    end
end

% for k=1:length(w)
%     if w(k,1) == 1
%         switch(k)
%             case {3, 7, 11}
%                 %disp('A');
%                 break;
%             case {1, 6, 12, 16}
%                 %disp('E');
%                 break;
%             case {14, 15, 18}
%                 %disp('I');
%                 break;
%             case {4, 8, 13, 17}
%                 %disp('O');
%                 break;
%             case {5, 9, 10, 19, 20}
%                 %disp('U');
%                 break;
%         end
%     end
% end

