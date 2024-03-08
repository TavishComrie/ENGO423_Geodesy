close all;

theta = 0:180;
t = cosd(theta);

for i = 1:size(t,2)
    P = Pnm(20,t(1,i));
    Results(i,1) = P(16,16); 
    Results(i,2) = P(16,6);
    Results(i,3) = P(16,1);
   
end




figure
Results1 = plot(theta,Results(:,1),'-');

title('Normalized Legendre function for m = 15');
xlabel('Co-latitude [degrees]');
xlim([0 180]);
ylabel('P of index 15,15');
ylim([-5 5]);
grid on
hold off

figure
Results2 = plot(theta,Results(:,2),'-');
title('Normalized Legendre function for m = 5');
xlabel('Co-latitude [degrees]');
xlim([0 180]);
ylabel('P of index 15,5');
ylim([-5 5]);
grid on
hold off

figure
Results3 = plot(theta,Results(:,3),'-');
title('Normalized Legendre function for m = 0');
xlabel('Co-latitude [degrees]');
xlim([0 180]);
ylabel('P of index 15,0');
ylim([-5 7]);
grid on
hold off



nVals = [15,10,5];

P = Pnm(20,cosd(90));

for i = 1:size(nVals,2)
    n = nVals(1,i);
    sum(1,i) = 0;
    for m = 0:n
        mindex = m + 1;
        sum(1,i) = sum(1,i) + P(n+1,mindex)^2;
    end
end


SphericalHarmonics(20,15,15);
SphericalHarmonics(20,15,5);
SphericalHarmonics(20,15,0);


function [Rnm,Snm] = SphericalHarmonics(nmax,n,m)
    PnmVal(181,1) = zeros;
    Rnm(181,361) = zeros;
    Snm(181,361) = zeros;

    for theta = 0:180
        P = Pnm(nmax+1,cosd(theta));
        PnmVal(theta+1,1)=P(n+1,m+1);
        for lambda = 0:360
            Rnm(theta+1,lambda+1) = PnmVal(theta+1,1)*cosd(m*lambda);
            Snm(theta+1,lambda+1) = PnmVal(theta+1,1)*sind(m*lambda);
        end
    end

    G = Rnm + Snm; %I don't really know about this

    figure;
    hold on;
    imagesc([0 360],[0 180],G)
    xlabel(['Longitude, ' char(176)])
    ylabel(['Lattitude, ' char(176)])
    xlim([0 360])
    ylim([0 180])
    titlePhrase = ['Spherical Harmonic for n=' num2str(n) ',m=' num2str(m) ')'];
    title(titlePhrase)
    colorbar
end

