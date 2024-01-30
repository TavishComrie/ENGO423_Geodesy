function [rCI] = LAtoCI(az,zen,Xp,Yp,day,month,year,UT1,lat,long)
% CItoLA returns the position vector in the Local Astronomic Frame
% 
%
% HOW [rLA] = CItoLA(RA,Dec,Xp,Yp,day,month,year,UT1,lat,long)
% IN  RA    - Right Ascension Angle        [in Decimal Degrees]
%     Dec   - Declination Angle            [in Decimal Degrees]
%     Xp    - X Coordinate of the pole     [in Decimal Degrees] 
%     Yp    - Y Coordinate of the pole     [in Decimal Degrees]
%     day                                  
%     month
%     year
%     UT1   - universal time Greenwich      [decimal hours]
%     lat   - Astronomic Latitude           [decimal degrees]
%     long  - Astronomic Longitude          [decimal degrees]
% OUT rLA   - Position vector in the LA Frame  [decimal metres]
%
% NB  Due to the accuracy level of NUTATION, the result will be accurate to
%     about 0.1 s (of time).




P2 = zeros(3,3);
P2(1,1) = 1;
P2(2,2) = -1;
P2(3,3) = 1;


rLA = zeros(3,1);
rLA(1,1) = cosd(zen)*cosd(az);
rLA(2,1) = cosd(zen)*sind(az);
rLA(3,1) = sind(zen);

[t] = julian2000(year,month,day,UT1);
[gast] = jul2gast(UT1,t);
[eps0,deps,dpsi] = nutation(t);
[za,thetaa,zetaa] = precession(t);

P = R3(-zetaa)*R2(thetaa)*R3(-za);
N = R1(-eps0-deps)*R3(-dpsi)*R1(eps0);

rCI = inv(P)*inv(N)*R3(-gast*15)*R1(Yp)*R2(Xp)*R3(180-long)*R2(90-lat)*P2*rLA;
end

