function [yH] = NormalGravityatH(lat,h)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here



y = NormalGravity(lat);
yH = y * (1-(2./a)*(1+f+m-2.*f.*sind(lat).*sind(lat)).*h+3.*ya.*h.*h./(a.*a));
end