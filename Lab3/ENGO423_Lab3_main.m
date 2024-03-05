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


P = Pnm(20,cosd(0));


figure
Results1 = plot(theta,Results(i,1),'.-');

title('Gravitational Attraction of a Sphere against a Cylinder');
xlabel('X Distance (meters) in 100m increments');
ylabel('Gravitational Attraction (mGal)');
hold off
%{
figure
Results2 = plot(theta,Results(i,3),'.-');
hold off

figure
Results3 = plot(theta,Results(i,3),'.-');
hold off
%}







function P = Pnm(Nmax,t)
    theta = acosd(t);
    
    P(Nmax,Nmax) = zeros;
    P(1,1) = 1;
    P(2,2) = sqrt(3)*sind(theta);
    for n = 3:Nmax
        f1 = sqrt((2*n+1)/(2*n));
        P(n,n) = f1*sind(theta)*P(n-1,n-1);
    end

    for n = 2:Nmax
        f2 = sqrt((2*n)+1);
        P(n,n-1) = f2*cosd(theta)*P(n-1,n-1); 
    end
    
    for n = 3:Nmax
        for m = 1:n-2
            f3 = sqrt(((2*n)+1)/((n-m)*(n-m)));
            f4 = sqrt((2*n)-1);
            f5 = sqrt(((n+m-1)*(n-m-1))/((2*n)-3));

            P(n,m) = f3*((f4*cosd(theta)*P(n-1,m))-(f5*P(n-2,m)));
        end
    end
    

end

