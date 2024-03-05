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