warning off
close all
clear all

Fs = 44100;
order = 12;

AFreq = zeros(25, 1);
EFreq = zeros(25, 1);
IFreq = zeros(25, 1);
OFreq = zeros(25, 1);
UFreq = zeros(25, 1);

APeaks = zeros(25, 1);
EPeaks = zeros(25, 1);
IPeaks = zeros(25, 1);
OPeaks = zeros(25, 1);
UPeaks = zeros(25, 1);

aFolder = "A/A";
for i=1:25
    aAudioN = strcat(aFolder,string(i));
    aAudio = strcat(aAudioN, ".wav");
    [y,Fs] = audioread(aAudio);
    
    [pxx,f] = pyulear(y,order);
    freq = meanfreq(pxx, f);
    variance = var(pxx);
    meanpeaks = mean(findpeaks(pxx));
    varpeaks = var(findpeaks(y));
    
    S = fft(y);
    P2 = abs(S/length(y));
    phs = angle(fftshift(y));
    amp = ones(length(y)/2+1,1);
    %abs(camp)  % amplitude
    %angle(camp) % phase
    
    AFreq(i, 1) = meanpeaks;
    APeaks(i, 1) = freq;
end

eFolder = "E/E";
for i=1:25
    eAudioN = strcat(eFolder,string(i));
    eAudio = strcat(eAudioN, ".wav");
    [y,Fs] = audioread(eAudio);
    
    [pxx,f] = pyulear(y,order);
    freq = meanfreq(pxx, f);
    variance = var(pxx);
    meanpeaks = mean(findpeaks(pxx));
    varpeaks = var(findpeaks(y));
    
    S = fft(y);
    P2 = abs(S/length(y));
    phs = angle(fftshift(y));
    amp = ones(length(y)/2+1,1);
    %abs(camp)  % amplitude
    %angle(camp) % phase
    
    EFreq(i, 1) = meanpeaks;
    EPeaks(i, 1) = freq;
end

iFolder = "I/I";
for i=1:25
    iAudioN = strcat(iFolder,string(i));
    iAudio = strcat(iAudioN, ".wav");
    [y,Fs] = audioread(iAudio);
    
    [pxx,f] = pyulear(y,order);
    freq = meanfreq(pxx, f);
    variance = var(pxx);
    meanpeaks = mean(findpeaks(pxx));
    varpeaks = var(findpeaks(y));
    
    S = fft(y);
    P2 = abs(S/length(y));
    phs = angle(fftshift(y));
    amp = ones(length(y)/2+1,1);
    %abs(camp)  % amplitude
    %angle(camp) % phase
    
    IFreq(i, 1) = meanpeaks;
    IPeaks(i, 1) = freq;
end

oFolder = "O/O";
for i=1:25
    oAudioN = strcat(oFolder,string(i));
    oAudio = strcat(oAudioN, ".wav");
    [y,Fs] = audioread(oAudio);
    
    [pxx,f] = pyulear(y,order);
    freq = meanfreq(pxx, f);
    variance = var(pxx);
    meanpeaks = mean(findpeaks(pxx));
    varpeaks = var(findpeaks(y));
    
    S = fft(y);
    P2 = abs(S/length(y));
    phs = angle(fftshift(y));
    amp = ones(length(y)/2+1,1);
    %abs(camp)  % amplitude
    %angle(camp) % phase
    
    OFreq(i, 1) = meanpeaks;
    OPeaks(i, 1) = freq;
end

uFolder = "U/U";
for i=1:25
    uAudioN = strcat(uFolder,string(i));
    uAudio = strcat(uAudioN, ".wav");
    [y,Fs] = audioread(uAudio);
    
    [pxx,f] = pyulear(y,order);
    freq = meanfreq(pxx, f);
    variance = var(pxx);
    meanpeaks = mean(findpeaks(pxx));
    varpeaks = var(findpeaks(y));
    
    S = fft(y);
    P2 = abs(S/length(y));
    phs = angle(fftshift(y));
    amp = ones(length(y)/2+1,1);
    %abs(camp)  % amplitude
    %angle(camp) % phase
    
    UFreq(i, 1) = meanpeaks;
    UPeaks(i, 1) = freq;
end

% Grafica del espacio de caracteristicas 
figure(4)
clf
plot(APeaks, AFreq,'rx')
hold on
plot(EPeaks, EFreq,'k*')
hold on
plot(IPeaks, IFreq,'bx')
hold on
plot(OPeaks, OFreq, 'g*')
hold on
plot(UPeaks, UFreq,'mx')
hold on
xlabel('Frequencia');
ylabel('Peaks')
legend('A','E','I','O','U')
