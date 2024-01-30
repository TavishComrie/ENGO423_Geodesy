% From lab handout
lattitude = 51.04;
longitude = -114.08;
RAHMS = [14 50 42.3258];
DecDMS = [74 9 19.814];
day = 16;
month = 1;
year = 2024;
timeUTCHMS = [6 26 15];

% From iers.org
xpDMS = [0 0 0.1073];
ypDMS = [0 0 0.2102];
UT1minusUTC = 7.38 / 1000; %Units of s

%Processing values
RA = dms2degrees(RAHMS) * 15;
Dec = dms2degrees(DecDMS);
Xp = dms2degrees(xpDMS);
Yp = dms2degrees(ypDMS);

timeUT1HMS = timeUTCHMS;
timeUT1HMS(1,3) = timeUT1HMS(1,3) + UT1minusUTC;
UT1 = dms2degrees(timeUT1HMS);

%Running the conversion
rLA = CItoLA(RA,Dec,Xp,Yp,day,month,year, UT1, lattitude,longitude)
%Converting to Azimuth and zenith
x = rLA(1,1);
y = rLA(2,1);
z = rLA(3,1);
[Azimuth, Zenith] = xyzToAz(x,y,z);

%Checking the conversion
rCI = LAtoCI(Azimuth,Zenith,Xp,Yp,day,month,year, UT1, lattitude,longitude)
x = rCI(1,1);
y = rCI(2,1);
z = rCI(3,1);
[RACheck, DecCheck] = xyzToAz(x,y,z);

RACheck
RA
DecCheck
Dec


