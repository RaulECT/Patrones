% CLASIDFICAR NUMEROA ALEATORIIOS

% DATOS DE ENTRADA
P = rand(2, 1000); % 2 descriptores y 1000 fotos
plot( P(1,:), P(2,:), '*r' )

%DEFINICION SOM
net = selforgmap( [5,5] );
net.trainParam.epochs = 200;

% ENTRENAMIENTO
net = train(net,P);

%CLASIFICACION RED ENTRADA
y = net(P);
classes = vect2ind(y);

% CLASIFICACION CON NUEVOS DATOS
Q = rand(2, 10);
w = net(Q);
classes2 = vec2ind(w);
