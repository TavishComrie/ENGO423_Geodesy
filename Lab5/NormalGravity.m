function [y] = NormalGravity(lat)
%Finds gravity on ellipsoid, WGS80
ya = 9.7803267715;
k = 0.001931851353;
e2 = 0.00669438002290;

sinl = sind(lat).^2;

y = ya .* (1.+k.*sinl) ./ sqrt(1.- e2 .* sinl);

end