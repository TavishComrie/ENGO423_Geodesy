function [A,zenith] = xyzToAz(x,y,z)
    A = atan2d(y,x);
    p = sqrt(x*x+y*y);
    zenith = atan2d(z,p);

    if (A<0)
        A = A + 360;
    end
end

