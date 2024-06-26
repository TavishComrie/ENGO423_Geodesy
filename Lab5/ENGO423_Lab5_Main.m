clc
close all

%Following Code is Autogenerated by MATLAB
%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 5);

% Specify sheet and range
opts.Sheet = "PR-all";
opts.DataRange = "A3:E112";

% Specify column names and types
opts.VariableNames = ["BM", "fidecimalDegree", "lambdadecimaDegree", "NormalHeightH", "gmGal"];
opts.VariableTypes = ["double", "double", "double", "double", "double"];

% Import the data
tbl = readtable("Normal_Heights_Gravity_Line1.xls", opts, "UseExcel", false);

%% Convert to output type
BM = tbl.BM;
fiDD = tbl.fidecimalDegree;
lambdaDD = tbl.lambdadecimaDegree;
NormalHeightH = tbl.NormalHeightH;
gmGal = tbl.gmGal;

%% Clear temporary variables
clear opts tbl
%From here it is our own code

importfile("Faye_Anomaly.mat");
importfile("GravityAnomaly_GM_200.mat");
[NormalHeightH,I] = sort(NormalHeightH);



%Initializes vectors
ybar = zeros(size(NormalHeightH,1),1);
ybar45 = zeros(size(NormalHeightH,1),1);
C = zeros(size(NormalHeightH,1),1);
g = gmGal*1E-5;
g = g(I,:);
fiDD = fiDD(I,:);
[NormalHeightH,i] = sort(NormalHeightH);



%Finds gravity values
for i = 1:size(NormalHeightH)
    ybar45(i) = NormalGravity(45);
    [ybar(i),y(i)] = meanNormalGravity(fiDD(i),NormalHeightH(i));

end

%Finds C values
for i = 1:size(NormalHeightH,1)
    C(i,1) = NormalHeightH(i)*ybar(i);
end

%Initializes vectros
H = zeros(size(NormalHeightH,1),1);
Hd = zeros(size(NormalHeightH,1),1);

%Finds H values
for i = 1:size(NormalHeightH,1)
    H(i) = OrthoHeight(C(i),g(i),NormalHeightH(i));
    Hd(i) = C(i)/ ybar45(i);
end

%Outputs results
Hcorr = PlotHeights(NormalHeightH-H,NormalHeightH,"Normal Heights","Helmert and Normal Height Difference");

HdCorr = PlotHeights(H-Hd,H,"Helmert Height","Helmert and Dynamic Height Difference");




%% Task 1.2

%Finds change in gravitys
deltag = g - NormalGravityatH(fiDD,NormalHeightH);
deltagBouger = g*1E5 - NormalGravityatH(fiDD,NormalHeightH)*1E5 - 0.1119.*NormalHeightH;


gravAnomCorr = PlotGrav(deltag,NormalHeightH,"Normal Height","Gravity Anomalies");
gravAnomBougerCorr = PlotGrav(deltagBouger*1E-5,NormalHeightH,"Normal Height","Bouger Anomalies");

Bdiff = BouguerDiff(deltagBouger*1E-5,H, ybar);

EmpRelationship = PlotHeights(abs(Bdiff-(NormalHeightH-H)),H,"Orthometric Height","Bouguer Difference and Helmert Difference Difference");

%% Task 2

%Finds the difference between Faye Anomaly and long wavelength model
FayeDiff = Faye_Anomaly-GravityAnomaly_GM_200;
writematrix(FayeDiff,"FayeDiff.txt");


%% Task 1.1 Functions
function [H] = OrthoHeight(C,g,Hstar)

     while true
          gMean = g*1E5+(0.0424*Hstar);
          H = C/(gMean*1E-5);

          if abs((Hstar-H)/H)<0.0001
              break
          else
              Hstar = H;
          end
     end
       
end

function [corr] = PlotHeights(Hdiff,H,xaxis,yaxis)
    figure;
    plot(H,Hdiff,"-")
    xPhrase = [xaxis '(m)'];
    yPhrase = [yaxis '(m)'];
    titlePhrase = [xaxis ' vs ' yaxis ' at Each Benchmark'];

    title(titlePhrase);
    xlabel(xPhrase);
    ylabel(yPhrase);

    corr = corrcoef(Hdiff,H);
end

function [corr] = PlotGrav(Hdiff,H,xaxis,yaxis)
    figure;
    plot(H,Hdiff,"-")
    xPhrase = [xaxis '(m)'];
    yPhrase = [yaxis '(m/s^2)'];
    titlePhrase = [xaxis ' vs ' yaxis ' at Each Benchmark'];

    title(titlePhrase);
    xlabel(xPhrase);
    ylabel(yPhrase);

    corr = corrcoef(Hdiff,H);
end

%% Task 1.2 Functions
function [Bdiff] = BouguerDiff(gB,H,gBar)
    Bdiff = gB.*H./gBar;
end