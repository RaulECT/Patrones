%DATOS DE ENTRADA
mu = [-3,5];
sigma = [1,.2;.2,1.8];
cases = 400;
P1 = mvnrnd( mu, sigma, cases );

mu2 = [100,110];
sigma2 = [9,8.2;8.2,9.8];
cases2 = 400;
P2 = mvnrnd( mu2, sigma2, cases2 );

mu3 = [-30,-21];
sigma3 = [1,.2;.2,1.8];
cases3 = 400;
P3 = mvnrnd( mu3, sigma3, cases3 );

mu4 = [10,12];
sigma4 = [1,.2;.2,1.8];
cases4 = 400;
P4 = mvnrnd( mu4, sigma4, cases4 );


P = [P1,P2,P3,P4]'; %REPETIR CON VARIAS PS

plot( P(1,:), P(2,:), '*r' )

% BD DE ENTRENAMIENTO Y VALIDACION


% DEFINICION SOM
net = selforgmap([66]);
net.trainParam.epochs = 200;

% CLASIFICAR RED CON RED DE ENTRADA
y = net(P);
classes = vect2ind(y);

% ENTRENAMIENTO
net = train(net,P);
