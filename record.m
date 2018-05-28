%CÛdigo para guardar audios de entrenamiento
fs=44100;

disp('Say A.');
recObj1 = audiorecorder(fs, 16, 1);
%recordblocking(recObj1, 3);
record(recObj1);
pause(3);
stop(recObj1);
y = getaudiodata(recObj1);
%figure(1), plot(y);
filename = 'A34.wav';
audiowrite(filename, y, fs);

disp('Say E.');
recObj2 = audiorecorder(fs, 16, 1);
%recordblocking(recObj2, 3);
record(recObj2);
pause(3);
stop(recObj2);
y2 = getaudiodata(recObj2);
%figure(2), plot(y2);
filename2 = 'E34.wav';
audiowrite(filename2, y2, fs);

disp('Say I.');
recObj3 = audiorecorder(fs, 16, 1);
%recordblocking(recObj3, 3);
record(recObj3);
pause(3);
stop(recObj3);
y3 = getaudiodata(recObj3);
%figure(3), plot(y3);
filename3 = 'I34.wav';
audiowrite(filename3, y3, fs);

disp('Say O.');
recObj4 = audiorecorder(fs, 16, 1);
%recordblocking(recObj4, 3);
record(recObj4);
pause(3);
stop(recObj4);
y4 = getaudiodata(recObj4);
%figure(4), plot(y4);
filename4 = 'O34.wav';
audiowrite(filename4, y4, fs);

disp('Say U.');
recObj5 = audiorecorder(fs, 16, 1);
%recordblocking(recObj5, 3);
record(recObj5);
pause(3);
stop(recObj5);
y5 = getaudiodata(recObj5);
%figure(5), plot(y5);
filename5 = 'U34.wav';
audiowrite(filename5, y5, fs);