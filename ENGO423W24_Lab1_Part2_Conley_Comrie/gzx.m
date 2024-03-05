function gzx = gzx(p1,p2,R,z,x)
    G = 6.6742*10^-11;
    p = p2-p1;
    first = (4*pi*G*p*R^3);
    second = z./(x.^2.+z.^2).^(5./2);
    gzx = first.*second.*-0.5.*2.*x;
    gzx = gzx.*10.^9;
end