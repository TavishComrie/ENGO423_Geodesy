function [y,yh] = NormalGravity(a,b,lat,ya,yb,h,w)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

k = (b*yb-a*ya) / (a*ya)
e = sqrt((a*a-b*b)/(a*a))
%m = w * w * a * a * b / (getG()*M);
m = 0.00344978600308

f = (a-b)/a;

y = ya * (1+k*sind(lat)*sind(lat)) / sqrt(1-e*e*sind(lat)*sind(lat));

yMod = 1 - (2/a)*(1+f+m-2*f*sind(lat)*sind(lat))*h+3*ya*h*h/(a*a);

yh = y * yMod;


end