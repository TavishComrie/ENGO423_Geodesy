function [t,mjd,jd] = julian2000(y,m,d,ut1)

% JULIAN2000 returns the time since the epoch J2000.0
%
% HOW [t,mjd] = julian2000(y,m,d,ut1)
% IN  y   - year (4-digit!)
%     m   - month
%     d   - day
%     ut1 - universal time Greenwich      [decimal hours]
% OUT t   - time since the epoch J2000.0  [in Julian centuries (of 36525 days)]
%     mjd - modified Julian day           [days]
%
% NB  The transformation is exact.

%----------------------------------------------------------------------------
% Sneeuw/Zebhauser, IAPG, TU Munich                                  04/01/96
%----------------------------------------------------------------------------
% uses none
%
%----------------------------------------------------------------------------
% revision history
% .980121NS: y/m/d-tests adapted. Vectorial input of y/m/d allowed.
% .980122NS: MJD-output.
% .Oct.2001,NS: translation of original NUTWINK.M 
%----------------------------------------------------------------------------
% remarks
%
%----------------------------------------------------------------------------

% error checking
if any(m(:)>12 | m(:)<1), error('Month between 1 and 12'), end
if any(d(:)>31 | d(:)<1), error('Day between 1 and 31'), end
if any(rem(y(:),1) ~=0) | any(rem(m(:),1) ~=0) | any(rem(d(:),1) ~=0) 
   error('Year, Month, Day must be integer')
end

% The auxiliary variable is the Julian Day
jd  = 367*y - floor(7*(y+floor((m+9)/12))/4);
jd  = jd + floor(275*m/9) + d + 1721014 + ut1/24 - 0.5;
t   = (jd-2451545)/36525;
mjd =  jd-2400000.5;				% modified jd
