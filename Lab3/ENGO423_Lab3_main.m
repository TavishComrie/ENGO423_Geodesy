close all;

theta = -180:0.01:180;
t = cosd(theta);

for i = 1:size(t,2)
    P = Pnm(21,t(1,i));
    Results(i,1) = P(16,16); 
    Results(i,2) = P(16,6);
    Results(i,3) = P(16,1);
    check(i,1) = P(2,2);
end


%P = Pnm(20,cosd(0));


%figure
%Results1 = plot(theta,Results(i,1),'.-');

%title('Gravitational Attraction of a Sphere against a Cylinder');
%xlabel('X Distance (meters) in 100m increments');
%ylabel('Gravitational Attraction (mGal)');
%hold off
%{
figure
Results2 = plot(theta,Results(i,3),'.-');
hold off

figure
Results3 = plot(theta,Results(i,3),'.-');
hold off
%}


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