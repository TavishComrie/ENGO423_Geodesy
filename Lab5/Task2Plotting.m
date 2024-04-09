%Imports all data
importfile("GeoidUndulation_GM_200.mat");
importfile("N_EGM2008_2160.mat");

NStokes = importfileTxt('exe files\NStokes.txt', 2, 7921);
NIND = importfileTxt('exe files\NStokes.txt', 2, 7921);

NStokes = reshape(NStokes',240,330)';
NIND = reshape(NIND',240,330)';


%Plots all results
%% 2.a
plotWavelengths(GeoidUndulation_GM_200)

%% 2.b
plotWavelengths(NStokes)

%% 2.c
plotWavelengths(NIND)

%% 2.d
N = GeoidUndulation_GM_200 + NStokes + NIND;
plotWavelengths(N)

%% 2.e
plotWavelengths(N_EGM2008_2160)

%% Output Statistics
[minN,maxN,meanN,sdN] = statisticsN(N);
[minN08,maxN08,meanN08,sdN08] = statisticsN(N);

function plotWavelengths(data,title)
    %Plots the results across each lat, long
    figure;
    hold on;
    imagesc([-118 -110],[49 90],data)
    hold on
    plot(long,lat);
    xlabel(['Longitude, ' char(176)])
    ylabel(['Lattitude, ' char(176)])
    xlim([-180 180])
    ylim([-90 90])
    titlePhrase = ['Gravity Anomaly Δg (mGal) for n=' num2str(n) ',m=' num2str(m) ')'];
    title(titlePhrase)
    colorbar
end