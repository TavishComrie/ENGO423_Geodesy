function P = Pnm(Nmax,t)
    theta = acosd(t);
    
    P(Nmax+1,Nmax+1) = zeros;
    P(1,1) = 1;
    P(2,2) = sqrt(3)*sind(theta);

    for n = 2:Nmax+1
        nindex = n + 1;
        f1 = sqrt((2*n+1)/(2*n));
        P(nindex,nindex) = f1*sind(theta)*P(nindex-1,nindex-1);
    end

    for n = 1:Nmax+1
        nindex = n + 1;
        f2 = sqrt((2*n)+1);
        P(nindex,nindex-1) = f2*cosd(theta)*P(nindex-1,nindex-1); 
    end
    
    for n = 2:Nmax+1
        nindex = n + 1;
        for m = 0:nindex-2
            mindex = m + 1;
            f3 = sqrt(((2*n)+1)/((n-m)*(n+m)));
            f4 = sqrt((2*n)-1);
            f5 = sqrt(((n+m-1)*(n-m-1))/((2*n)-3));

            P(nindex,mindex) = f3*((f4*cosd(theta)*P(nindex-1,mindex))-(f5*P(nindex-2,mindex)));
        end
    end
    

end

