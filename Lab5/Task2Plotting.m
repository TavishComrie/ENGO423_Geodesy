clear all;
clc;
close all;

importfile("GeoidUndulation_GM_200.mat");
importfile("N_EGM2008_2160.mat");

NStokes = readmatrix('NStokes60V3');
NStokes = reshape(NStokes',240,330)';

NIND = readmatrix('indrt.dat');
NIND = reshape(NIND',240,330)';



%% 2.a
plotWavelengths(GeoidUndulation_GM_200, 'Geoid Height Long Wavelengths from GOCO02S nmax=200 (m)')

%% 2.b
plotWavelengths(NStokes, 'Geoid Height Medium Wavelengths from Stokes Integral (m)')

%% 2.c
plotWavelengths(NIND, 'Geoid Height from Indirect Effect (m)')

%% 2.d
N = GeoidUndulation_GM_200 + NStokes + NIND;
plotWavelengths(N, 'Combined Geoid Height From Long, Medium and Short Wavelengths (m)')

%% 2.e
plotWavelengths(N_EGM2008_2160, 'EGM2008 Geoid Height (m)')

%% Output Statistics
[resultsN] = statisticsN(N);
[resultN08] = statisticsN(N_EGM2008_2160);
[resultsDiff] = statisticsN(N_EGM2008_2160-N);


function plotWavelengths(data,titlePhrase)
    %Plots the results across each lat, long
    figure;
    hold on;
    imagesc([-118 -110],[60 49],data)
    hold on
    xlabel(['Longitude, ' char(176)])
    ylabel(['Lattitude, ' char(176)])
    xlim([-118 -110])
    ylim([49 60])
    title(titlePhrase)
    colorbar
end

function [results] = statisticsN(data)
    minVal = min(min(data));
    maxVal = max(max(data));
    [sdVal,meanVal] = std(data,0,'all');

    results = [minVal;maxVal; meanVal; sdVal];
end