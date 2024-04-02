function [yH] = NormalGravityatH(lat,h)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
ya = 9.7803267715;
a = 6378137;
f = 0.00335281068118;
m = 0.00344978600308;

y = NormalGravity(lat);
yH = y .* (1-(2./a)*(1+f+m-2.*f.*sind(lat).*sind(lat)).*h+3.*ya.*h.*h./(a.*a));
end