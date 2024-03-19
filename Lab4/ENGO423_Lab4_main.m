close all;
clear variables;

%constants
GM = 3.986004415*10^14;
J2 = 108263 *10^-8;
J4 = -2.37091222*10^-6;
J6 = 6.08347*10^-9;
J8 = 01.427*10^-11;
Grav = 9.798;
nMax1 = 20;
nMax2 = 70;
J(100,1) = zeros;
J(3,1) = J2;
J(5,1) = J4;
J(7,1) = J6;
J(9,1) = J8;
R = 6.3781*10^6;
r = R+375000;
Cnm = load("Cnm.mat").Cnm;
Snm = load("Snm.mat").Snm;
lat = load("lat.mat").lat;
long = load("long.mat").long;

for i = 1:4
    n = 2*i;
    J(n+1) = J(n+1)/sqrt((2*n)+1);
end

%Generates plots for nmax=20, n=15, m = [15,5,0]
N1 = GeoidUndulation(nMax1,GM,R,R,Grav,J,Cnm,Snm,lat,long);
N2 = GeoidUndulation(nMax2,GM,R,R,Grav,J,Cnm,Snm,lat,long);

N375_1 = GeoidUndulation(nMax1,GM,R,r,Grav,J,Cnm,Snm,lat,long);
N375_2 = GeoidUndulation(nMax2,GM,R,r,Grav,J,Cnm,Snm,lat,long);

Anom = GravityAnomaly(nMax2,GM,R,J,Cnm,Snm,lat,long);
%Plots the spherical harmonics  across all lat and long
function [N] = GeoidUndulation(nmax,GM,R,r,Grav,J,Cnm,Snm,lat,long)

    %Initializes each result matrix
    N(181,361) = zeros;
    
   
    for theta = 0:180
        %Creates P based on lat
        P = Pnm(nmax,cosd(theta));

        %For each longitude
        for lambda = -180:180
            total = 0;
            for n = 2:nmax
                Sum = 0;
                for m = 0:n
                deltaC = Cnm(n+1,m+1)+J(n+1,1);
                deltaS = Snm(n+1,m+1);
                term1 = deltaC*cosd(m*lambda);
                term2 = deltaS*sind(m*lambda);
                
                Sum = Sum +((term1+term2)*P(n+1,m+1));
                end
                total = total + (Sum*(R/r)^(n+1));
            end
            N(theta+1,lambda+181) = total*((GM)/(R*Grav));
            
        end
    end


    %Plots the results across each lat, long
    figure;
    hold on;
    imagesc([-180 180],[90 -90],N)
    hold on
    plot(long,lat);
    xlabel(['Longitude, ' char(176)])
    ylabel(['Lattitude, ' char(176)])
    xlim([-180 180])
    ylim([-90 90])
    titlePhrase = ['Spherical Harmonic R for n=' num2str(n) ',m=' num2str(m) ')'];
    title(titlePhrase)
    colorbar

%     figure;
%     hold on;
%     imagesc([0 360],[0 180],Snm)
%     xlabel(['Longitude, ' char(176)])
%     ylabel(['Lattitude, ' char(176)])
%     xlim([0 360])
%     ylim([0 180])
%     titlePhrase = ['Spherical Harmonic S for n=' num2str(n) ',m=' num2str(m) ')'];
%     title(titlePhrase)
%     colorbar
end

function A = GravityAnomaly(nmax,GM,R,J,Cnm,Snm,lat,long)

    %Initializes each result matrix
    A(181,361) = zeros;
    
   
    for theta = 0:180
        %Creates P based on lat
        P = Pnm(nmax,cosd(theta));

        %For each longitude
        for lambda = -180:180
            total = 0;
            for n = 2:nmax
                Sum = 0;
                for m = 0:n
                deltaC = Cnm(n+1,m+1)+J(n+1,1);
                deltaS = Snm(n+1,m+1);
                term1 = deltaC*cosd(m*lambda);
                term2 = deltaS*sind(m*lambda);
                
                Sum = Sum +((term1+term2)*P(n+1,m+1));
                end
                total = total + (Sum*(n-1));
            end
            A(theta+1,lambda+181) = total*((GM)/(R));
            
        end
    end


    %Plots the results across each lat, long
    figure;
    hold on;
    imagesc([-180 180],[-90 90],A)
    hold on
    plot(long,lat);
    xlabel(['Longitude, ' char(176)])
    ylabel(['Lattitude, ' char(176)])
    xlim([-180 180])
    ylim([-90 90])
    titlePhrase = ['Spherical Harmonic R for n=' num2str(n) ',m=' num2str(m) ')'];
    title(titlePhrase)
    colorbar
end