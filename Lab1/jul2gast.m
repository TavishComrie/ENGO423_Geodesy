function [gast,gmst] = jul2gast(ut1,t)

% JUL2GAST returns the Greenwich Actual (true) Siderial Time (GAST)
%
% HOW gast = jul2gast(ut1,t)
% IN  t    - time since epoch J2000.0        [in Julian centuries (of 36525 days)]
%     ut1  - universal time Greenwich        [decimal hours]
% OUT gast - Greenwich Actual Siderial Time  [decimal hours !!!]
%
% NB  Due to the accuracy level of NUTATION, the result will be accurate to
%     about 0.1 s (of time).

%----------------------------------------------------------------------------
% Sneeuw/Zebhauser, IAPG, TU Munich                                  04/01/96
%----------------------------------------------------------------------------
% uses NUTATION
%
%----------------------------------------------------------------------------
% revision history
% .Oct.2001,NS: translation of original PREZWINK.M 
%----------------------------------------------------------------------------
% remarks
%
%----------------------------------------------------------------------------

% Here we go
gmst = (ut1*3600 + 24110.54841 + 8640184.812866*t + 0.093104*t.^2 ...
        - 6.2e-6*t.^3) /3600;
[eps0,deleps,delpsi] = nutation(t);
epsi = (eps0 + deleps) / 180 * pi;
eq   = delpsi .* cos(epsi);
gast = gmst + eq/15;
gast = rem(rem(gast,24)+24,24);
gmst = rem(rem(gmst,24)+24,24);
