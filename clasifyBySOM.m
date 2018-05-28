function [ y, classes, net ] = clasifyBySOM( P, epchocs, neurons ) 
    net = selforgmap(neurons);
    net.trainParam.epochs = epchocs;
    
    net = train(net,P);
    
    y = net(P);
    classes = vec2ind(y);
end