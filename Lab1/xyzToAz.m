function [A,zenith] = xyzToAz(x,y,z)
% xyzToAz returns the azimuth and zenith from xyz to the LA frame
% 
%
% HOW [A,zenith] = xyzToAz(x,y,z)
%     x    - X Coordinate LA     [in Decimal metres] 
%     y    - Y Coordinate LA     [in Decimal metres]
%     z    - Z Coordinate LA     [in Decimal metres]
% OUT A    - Azimuth in the LA Frame  [Decimal degrees]
% OUT z    - Zenith in the LA Frame  [Decimal degrees]
%

    A = atan2d(y,x);
    zenith = acosd(z);

    if (A<0)
        A = A + 360;
    end
end

