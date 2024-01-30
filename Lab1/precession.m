function [za,thetaa,zetaa] = precession(t)

% PRECESSION returns the 3 precession angles
%
% HOW [za,thetaa,zetaa] = precession(t)
% IN  t      - time since epoch J2000.0 [in Julian centuries (of 36525 days)]
% OUT za    \
%     thetaa - precession angles        [decimal deg.]
%     zetaa /
%
% NB  The accuracy of the formulae is about 1 arcsec. 

%----------------------------------------------------------------------------
% Sneeuw/Zebhauser, IAPG, TU Munich                                  04/01/96
%----------------------------------------------------------------------------
% uses none
%
%----------------------------------------------------------------------------
% revision history
% .Oct.2001,NS: translation of original PREZWINK.M 
%----------------------------------------------------------------------------
% remarks
%
%----------------------------------------------------------------------------

% Here we go
zetaa  = (2306.2181 * t + 0.30188 * t.^2)/3600;
za     = (2306.2181 * t + 1.09468 * t.^2)/3600;
thetaa = (2004.3109 * t - 0.42665 * t.^2)/3600;
