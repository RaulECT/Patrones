%Código para testear plots
order=12;
fs=44100;
%[y,fs] = audioread('A/A1.wav');
%sound(y,fs);
%t = linspace(0, 1, size(y,1))'/fs;
%figure (1)
%plot(t,y);

%[y,fs] = audioread('A/A1.wav');
%[pxx,f] = pyulear(y,order);
%freq1 = meanfreq(pxx, f);

[y,fs] = audioread('A/A7.wav');
[pxx,f] = pyulear(y,order);
fa1 = meanfreq(pxx, f);
va1 = var(pxx);
fpa1 = mean(findpeaks(pxx));
fma1 = var(findpeaks(pxx));
ra1 = var(findpeaks(y));
ha1 = max(findpeaks(y));
%figure(4), plot(y);

[y,fs] = audioread('A/A8.wav');
[pxx,f] = pyulear(y,order);
fa2 = meanfreq(pxx, f);
va2 = var(pxx);
fpa2 = mean(findpeaks(pxx));
fma2 = var(findpeaks(pxx));
ra2 = var(findpeaks(y));
ha2 = max(findpeaks(y));
%figure(5), plot(y);

[y,fs] = audioread('A/A3.wav');
[pxx,f] = pyulear(y,order);
fa3 = meanfreq(pxx, f);
fpa3 = mean(findpeaks(pxx));
va3 = var(pxx);
fma3 = var(findpeaks(pxx));
ra3 = var(findpeaks(y));
ha3 = max(findpeaks(y));
%figure(6), plot(y);

[y,fs] = audioread('A/A4.wav');
[pxx,f] = pyulear(y,order);
fa4 = meanfreq(pxx, f);
fpa4 = mean(findpeaks(pxx));
va4 = var(pxx);
fma4 = var(findpeaks(pxx));
ra4 = var(findpeaks(y));
ha4 = max(findpeaks(y));

[y,fs] = audioread('A/A5.wav');
[pxx,f] = pyulear(y,order);
fa5 = meanfreq(pxx, f);
fpa5 = mean(findpeaks(pxx));
va5 = var(pxx);
fma5 = var(findpeaks(pxx));
ra5 = var(findpeaks(y));
ha5 = max(findpeaks(y));

[y,fs] = audioread('E/E1.wav');
[pxx,f] = pyulear(y,order);
fe1 = meanfreq(pxx, f);
fpe1 = mean(findpeaks(pxx));
ve1 = var(pxx);
fme1 = var(findpeaks(pxx));
re1 = var(findpeaks(y));
he1 = max(findpeaks(y));
%figure(2), plot(f,pxx);

[y,fs] = audioread('E/E2.wav');
[pxx,f] = pyulear(y,order);
fe2 = meanfreq(pxx, f);
fpe2 = mean(findpeaks(pxx));
ve2 = var(pxx);
fme2 = var(findpeaks(pxx));
re2 = var(findpeaks(y));
he2 = max(findpeaks(y));

[y,fs] = audioread('E/E4.wav');
[pxx,f] = pyulear(y,order);
fe4 = meanfreq(pxx, f);
fpe4 = mean(findpeaks(pxx));
ve4 = var(pxx);
fme4 = var(findpeaks(pxx));
re4 = var(findpeaks(y));
he4 = max(findpeaks(y));

[y,fs] = audioread('E/E5.wav');
[pxx,f] = pyulear(y,order);
fe5 = meanfreq(pxx, f);
fpe5 = mean(findpeaks(pxx));
ve5 = var(pxx);
fme5 = var(findpeaks(pxx));
re5 = var(findpeaks(y));
he5 = max(findpeaks(y));

[y,fs] = audioread('prueba2/E5.wav');
[pxx,f] = pyulear(y,order);
fe3 = meanfreq(pxx, f);
fpe3 = mean(findpeaks(pxx));
ve3 = var(pxx);
fme3 = var(findpeaks(pxx));
figure(1), plot(y);
re3 = var(findpeaks(y));
he3 = max(findpeaks(y));

[y,fs] = audioread('I/I1.wav');
[pxx,f] = pyulear(y,order);
fi1 = meanfreq(pxx, f);
fpi1 = mean(findpeaks(pxx));
vi1 = var(pxx);
fmi1 = var(findpeaks(pxx));
ri1 = var(findpeaks(y));
%figure(1), plot(y);

[y,fs] = audioread('I/I2.wav');
[pxx,f] = pyulear(y,order);
fi2 = meanfreq(pxx, f);
fpi2 = mean(findpeaks(pxx));
vi2 = var(pxx);
fmi2 = var(findpeaks(pxx));
ri2 = var(findpeaks(y));
%figure(2), plot(y);

[y,fs] = audioread('I/I3.wav');
[pxx,f] = pyulear(y,order);
fi3 = meanfreq(pxx, f);
fpi3 = mean(findpeaks(pxx));
vi3 = var(pxx);
fmi3 = var(findpeaks(pxx));
ri3 = var(findpeaks(y));
%figure(3), plot(y);

[y,fs] = audioread('I/I4.wav');
[pxx,f] = pyulear(y,order);
fi4 = meanfreq(pxx, f);
fpi4 = mean(findpeaks(pxx));
vi4 = var(pxx);
fmi4 = var(findpeaks(pxx));
ri4 = var(findpeaks(y));

[y,fs] = audioread('I/I5.wav');
[pxx,f] = pyulear(y,order);
fi5 = meanfreq(pxx, f);
fpi5 = mean(findpeaks(pxx));
vi5 = var(pxx);
fmi5 = var(findpeaks(pxx));
ri5 = var(findpeaks(y));

[y,fs] = audioread('O/O1.wav');
[pxx,f] = pyulear(y,order);
fo1 = meanfreq(pxx, f);
vo1 = var(pxx);
fpo1 = mean(findpeaks(pxx));
fmo1 = var(findpeaks(pxx));
ro1 = var(findpeaks(y));
%figure(4), plot(y);

[y,fs] = audioread('O/O2.wav');
[pxx,f] = pyulear(y,order);
fo2 = meanfreq(pxx, f);
fpo2 = mean(findpeaks(pxx));
vo2 = var(pxx);
fmo2 = var(findpeaks(pxx));
ro2 = var(findpeaks(y));
%figure(5), plot(y);

[y,fs] = audioread('O/O3.wav');
[pxx,f] = pyulear(y,order);
fo3 = meanfreq(pxx, f);
fpo3 = mean(findpeaks(pxx));
vo3 = var(pxx);
fmo3 = var(findpeaks(pxx));
ro3 = var(findpeaks(y));
%figure(6), plot(y);

[y,fs] = audioread('U/U1.wav');
[pxx,f] = pyulear(y,order);
fu1 = meanfreq(pxx, f);
fpu1 = mean(findpeaks(pxx));
vu1 = var(pxx);
fmu1 = var(findpeaks(pxx));
ru1 = var(findpeaks(y));
%figure(7), plot(y);

[y,fs] = audioread('U/U2.wav');
[pxx,f] = pyulear(y,order);
fu2 = meanfreq(pxx, f);
fpu2 = mean(findpeaks(pxx));
vu2 = var(pxx);
fmu2 = var(findpeaks(pxx));
ru2 = var(findpeaks(y));
%figure(8), plot(y);

[y,fs] = audioread('U/U3.wav');
[pxx,f] = pyulear(y,order);
fu3 = meanfreq(pxx, f);
fpu3 = mean(findpeaks(pxx));
vu3 = var(pxx);
fmu3 = var(findpeaks(pxx));
ru3 = var(findpeaks(y));
%figure(9), plot(y);