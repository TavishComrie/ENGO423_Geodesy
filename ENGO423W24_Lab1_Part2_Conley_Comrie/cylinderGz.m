function [hor_Gz] = cylinderGz(a,z,p1,p2,x)
p = p2-p1;
G = 6.6742*10^-11;

num = 2.*G.*pi.*a.^2.*z.*p;
denom = x.^2+z.^2;

hor_Gz = num./denom;
hor_Gz = hor_Gz.*10.^5;
end

