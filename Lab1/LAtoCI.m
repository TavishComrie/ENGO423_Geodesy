function [rCI] = LAtoCI(az,zen,Xp,Yp,day,month,year,UT1,lat,long)
% LatoCI returns the position vector in the Conventional Inertial Frame
% 
%
% HOW [rCI] = LAtoCI(az,zen,Xp,Yp,day,month,year,UT1,lat,long)
% IN  az    - Azimuth Angle                [in Decimal Degrees]
%     zen   - Zenith Angle                 [in Decimal Degrees]
%     Xp    - X Coordinate of the pole     [in Decimal Degrees] 
%     Yp    - Y Coordinate of the pole     [in Decimal Degrees]
%     day                                  
%     month
%     year
%     UT1   - universal time Greenwich      [decimal hours]
%     lat   - Astronomic Latitude           [decimal degrees]
%     long  - Astronomic Longitude          [decimal degrees]
% OUT rCI   - Position vector in the CI Frame  [decimal metres]
%
% NB  Due to the accuracy level of NUTATION, the result will be accurate to
%     about 0.1 s (of time).



%Creating the reflection matrix P2
P2 = zeros(3,3);
P2(1,1) = 1;
P2(2,2) = -1;
P2(3,3) = 1;

%Converting the Zenith and Azimuth Angle to XYZ Coords
rLA = zeros(3,1);
rLA(1,1) = sind(zen)*cosd(az);
rLA(2,1) = sind(zen)*sind(az);
rLA(3,1) = cosd(zen);

[t] = julian2000(year,month,day,UT1);   %Finding julian time using julian2000
[gast] = jul2gast(UT1,t);               %Finding the GAST using jul2gast
[eps0,deps,dpsi] = nutation(t);         %Finding nutation values
[za,thetaa,zetaa] = precession(t);      %Finding precession values

%Creating precession matrix using values from the precession function
P = R3(-zetaa)*R2(thetaa)*R3(-za);
%Creating nutation matrix using values from the nutation function
N = R1(-eps0-deps)*R3(-dpsi)*R1(eps0);

%Final formula to convert from rLA to rCI
rCI = inv(P)*inv(N)*R3(-gast*15)*R1(Yp)*R2(Xp)*R3(180-long)*R2(90-lat)*P2*rLA;
end

