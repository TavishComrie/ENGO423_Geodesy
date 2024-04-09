function [ybar,y] = meanNormalGravity(lat,Hs)
%Finds ybar based on Hs
y = NormalGravity(lat);

sinl = sind(lat).^2;

a = 6378137;
f = 0.00335281068118;
m = 0.00344978600308;

ybar = y .* (1 - (1 + f + m - 2 .* f .* sinl).*Hs./a + (Hs./a).^2);

end