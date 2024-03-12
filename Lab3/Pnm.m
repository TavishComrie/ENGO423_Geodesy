function P = Pnm(Nmax,t)
    %P returns a Nmax x Nmax matrix
    %t = cos(theta)

    %Converts t to theta
    theta = acosd(t);
    
    %Creates a P matrix (Nmax + 1 to factor in the 0 index)
    P(Nmax+1,Nmax+1) = zeros;

    %Sets the initial 2 base cases
    P(1,1) = 1;
    P(2,2) = sqrt(3)*sind(theta);

    %For each diagonal element starting with n=2, m=2
    for n = 2:Nmax+1
        %Advance index by 1 due to 0 index
        nindex = n + 1;

        %Calculate f1 (all that is needed for diagnonal recursion)
        f1 = sqrt((2*n+1)/(2*n));

        %Uses diagonal recursion equation
        P(nindex,nindex) = f1*sind(theta)*P(nindex-1,nindex-1);
    end

    %For each first step of vertical recursion stating with n=1
    for n = 1:Nmax+1
        %Advance index by 1 due to 0 index
        nindex = n + 1;

        %Calculate f2 (all that is needed for vertical step 1 recursion)
        f2 = sqrt((2*n)+1);

        %Use vertical step 1 recursion equation
        P(nindex,nindex-1) = f2*cosd(theta)*P(nindex-1,nindex-1); 
    end
    
    %For each additional vertical recursion step starting with n=2
    for n = 2:Nmax+1
        %Advance index by 1 due to 0 index
        nindex = n + 1;

        %For each m until reaching a already completed vertical recursion
        %first step
        for m = 0:nindex-2
            
            %Advance index by 1 due to 0 index
            mindex = m + 1;

            %Calculate f3,f4,f5
            f3 = sqrt(((2*n)+1)/((n-m)*(n+m)));
            f4 = sqrt((2*n)-1);
            f5 = sqrt(((n+m-1)*(n-m-1))/((2*n)-3));

            %Use vertical step 2 and beyond recursion equation
            P(nindex,mindex) = f3*((f4*cosd(theta)*P(nindex-1,mindex))-(f5*P(nindex-2,mindex)));
        end
    end
    

end

