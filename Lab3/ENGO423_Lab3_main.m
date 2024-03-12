close all;

%For every lattitude
theta = 0:180;

%Converts each lattitude to t
t = cosd(theta);

%For every t value
for i = 1:size(t,2)
    %Constructs P with nmax=20 and t(i)
    P = Pnm(20,t(1,i));

    %Saves the values for n=15,m=15,5,0. Values one ahead due to 0 indexing
    Results(i,1) = P(16,16); 
    Results(i,2) = P(16,6);
    Results(i,3) = P(16,1);
end



%Plots the results for each column in Results
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


%Task 1.b)

%3 n values to use
nVals = [15,10,5];

%Creates P matrix at co-latitude (theta = 90), nmax = 20
P = Pnm(20,cosd(90));

%For each n value to check
for i = 1:size(nVals,2)
    %Get the n value
    n = nVals(1,i);

    %Finds the sum starting at 0
    sum(1,i) = 0;

    %For each m value in the n row
    for m = 0:n
        %Corrects for 0 indexing
        mindex = m + 1;
        %Adds the square of the value at (n,m)
        sum(1,i) = sum(1,i) + P(n+1,mindex)^2;
    end
end

%Generates plots for nmax=20, n=15, m = [15,5,0]
SphericalHarmonics(20,15,15);
SphericalHarmonics(20,15,5);
SphericalHarmonics(20,15,0);

%Plots the spherical harmonics  across all lat and long
function [Rnm,Snm] = SphericalHarmonics(nmax,n,m)

    %Initializes each result matrix
    PnmVal(181,1) = zeros;
    Rnm(181,361) = zeros;
    Snm(181,361) = zeros;

    %For every lattitude
    for theta = 0:180
        %Creates P based on lat
        P = Pnm(nmax+1,cosd(theta));
        %Saves the P value at (n,m)
        PnmVal(theta+1,1)=P(n+1,m+1);

        %For each longitude
        for lambda = 0:360
            %Applies R and S formulas
            Rnm(theta+1,lambda+1) = PnmVal(theta+1,1)*cosd(m*lambda);
            Snm(theta+1,lambda+1) = PnmVal(theta+1,1)*sind(m*lambda);
        end
    end

    %Plots the results across each lat, long
    figure;
    hold on;
    imagesc([0 360],[0 180],Rnm)
    xlabel(['Longitude, ' char(176)])
    ylabel(['Lattitude, ' char(176)])
    xlim([0 360])
    ylim([0 180])
    titlePhrase = ['Spherical Harmonic R for n=' num2str(n) ',m=' num2str(m) ')'];
    title(titlePhrase)
    colorbar

    figure;
    hold on;
    imagesc([0 360],[0 180],Snm)
    xlabel(['Longitude, ' char(176)])
    ylabel(['Lattitude, ' char(176)])
    xlim([0 360])
    ylim([0 180])
    titlePhrase = ['Spherical Harmonic S for n=' num2str(n) ',m=' num2str(m) ')'];
    title(titlePhrase)
    colorbar
end

