function [rLA] = CItoLA(RA,Dec,Xp,Yp,day,month,year,UT1,lat,long)
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


%Creating the reflection matrix P2
P2 = zeros(3,3);
P2(1,1) = 1;
P2(2,2) = -1;
P2(3,3) = 1;

%Converting the Declination and Right Ascension Angle to XYZ Coords
rCI = zeros(3,1);
rCI(1,1) = cosd(Dec)*cosd(RA);
rCI(2,1) = cosd(Dec)*sind(RA);
rCI(3,1) = sind(Dec);


[t] = julian2000(year,month,day,UT1)   %Finding julian time using julian2000
[gast] = jul2gast(UT1,t);               %Finding the GAST using jul2gast
[eps0,deps,dpsi] = nutation(t)         %Finding nutation values
[za,thetaa,zetaa] = precession(t)      %Finding precession values

%Creating precession matrix using values from the precession function
P = R3(-za)*R2(thetaa)*R3(-zetaa)
%Creating nutation matrix using values from the nutation function
N = R1(-eps0-deps)*R3(-dpsi)*R1(eps0)

%Final formula to complete the actual transformation from rCI to rLA
rLA = P2*R2(-(90-lat))*R3(-(180-long))*R2(-Xp)*R1(-Yp)*R3(gast*15)*N*P*rCI;

end




