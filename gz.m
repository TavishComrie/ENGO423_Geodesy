function gz = gz(p1,p2,R,z,x)
    G = 6.6742*10^-11;
    p = p2-p1;
    first = (4*pi*G*p*R^3)/3;
    second = z./(x.^2.+z.^2).^(3./2);
    gz = first.*second;
    gz = gz.*10.^5;
end