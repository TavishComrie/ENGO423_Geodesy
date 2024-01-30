function [eps0,deps,dpsi] = nutation(t)

% NUTATION returns the 3 nutation angles
%
% HOW [eps0,deps,dpsi] = nutation(t)
% IN  t    - time since epoch J2000.0   [in Julian centuries (of 36525 days)]
% OUT eps0 - mean obliquity of ecliptic [decimal deg.]
%     deps - nutation in obliquity      [decimal deg.]
%     dpsi - nutation in longitude      [decimal deg.]
%
% NB  The accuracy of the formulae used is about 1 arcsec.

%----------------------------------------------------------------------------
% Sneeuw/Zebhauser, IAPG, TU Munich                                  04/01/96
%----------------------------------------------------------------------------
% uses none
%
%----------------------------------------------------------------------------
% revision history
% .Oct.2001,NS: translation of original NUTWINK.M 
%----------------------------------------------------------------------------
% remarks
%
%----------------------------------------------------------------------------


% Time difference since J2000
d  =  t * 36525;

% Auxiliary functions
f1 = (125 - 0.05295 * d) / 180 * pi;
f2 = (200.9 + 1.97129 * d) / 180 * pi;

% Here we go
eps0   = (84381.448 - 46.815 * t) / 3600;
dpsi = (-0.0048 * sin(f1) - 0.0004 * sin(f2));
deps = ( 0.0026 * cos(f1) + 0.0002 * cos(f2));
