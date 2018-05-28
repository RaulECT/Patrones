function classes = classify(characteristics, net)
   y = net(characteristics);
   classes = vec2ind(y); 
end