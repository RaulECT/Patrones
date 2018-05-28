

I = imread('t.png');
[N,M] = size(I);

J =not(I(:,:,1)>192);
J = bwareaopen(J,5,8); % remueve regiones muy pequenhas
[L,n] = bwlabel(J, 4);


stats = regionprops(L,'all');
characteristics = zeros(n, 2);

for i = 1:n
    characteristics(i, 1) = stats(i).MinorAxisLength / stats(i).MajorAxisLength;
    characteristics(i, 2) = stats(i).Eccentricity;
end

net = selforgmap([5,2]);
net = train(net,characteristics');
    
y = net(characteristics');
classes = vec2ind(y);

%A = zeros(N,M);
%O = zeros(N,M);
    
%for i = 1:n
%    if( classes(1, i) == 10 )
%        A(stats(i).PixelIdxList) = ones(stats(i).Area,1);
%    else
%      O(stats(i).PixelIdxList) = ones(stats(i).Area,1);
%    end
        
%    figure(3)
%    imshow([A;ones(30,M);O],[])
%end

I2 = imread('cartel_5.png');
[N2,M2] = size(I2);

J2 =not(I2(:,:,1)>192);
J2 = bwareaopen(J2,5,8); % remueve regiones muy pequenhas
[L2,n2] = bwlabel(J2, 4);


stats2 = regionprops(L2,'all');
characteristics2 = zeros(n2, 2);

for i = 1:n2
    characteristics2(i, 1) = stats2(i).MinorAxisLength / stats2(i).MajorAxisLength;
    characteristics2(i, 2) = stats2(i).Eccentricity;
end

y2 = net(characteristics2');
classes2 = vec2ind(y2);

A = zeros(N2,M2);
O = zeros(N2,M2);
    
for i = 1:n2
    if( classes2(1, i) == 1 || classes2(1, i) == 8 )
        A(stats2(i).PixelIdxList) = ones(stats2(i).Area,1);
    else
      O(stats2(i).PixelIdxList) = ones(stats2(i).Area,1);
    end
        
    figure(3)
    imshow([A;ones(30,M2);O],[])
end