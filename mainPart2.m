close all
R = 100;
z = 275;
p2 = 4260;
p1 = 2760;
x = -5000:100:5000;


%2.1 Part A
Gz = gz(p1,p2,R,z,x);

plot(x,Gz,".-")
title('Gravitational Attraction of a Sphere');
xlabel('X Distance (meters) in 100m Increments');
ylabel('Gravitational Attraction (mGal)');
hold off;



%2.1 Part B
figure

[xmesh,ymesh]=meshgrid(x,y);


Z = sqrt(xmesh.^2+ymesh.^2);

Gz2 = gz(p1,p2,R,z,Z);

mesh(xmesh,ymesh,Gz2)
colorbar;
grid on

%2.2 Part A
figure
z1 = 350;

Gz3 = gz(p1,p2,R,z1,x);

plot(x,Gz,'.-')
hold on
plot(x,Gz3,'.-')
title('Gravitational Attraction of Spheres at Varying Depths');
xlabel('X Distance (meters) in 100m increments');
ylabel('Gravitational Attraction (mGal)');

%2.2 Part B

figure
p3 = 5760;

Gz4 = gz(p1,p3,R,z,x);

plot(x,Gz,'.-')
hold on
plot(x,Gz4,'.-')
title('Gravitational Attraction of Spheres at Varying Densities');
xlabel('X Distance (meters) in 100m increments');
ylabel('Gravitational Attraction (mGal)');

%2.2 Part C
Gzx = gzx(p1,p2,R,z,x);
Gzx1 = gzx(p1,p3,R,z1,x);

figure
plot(x,Gzx,'.-')
hold on
plot(x,Gzx1,'.-')

title('Horizontal Gravitational Acceleration of a Sphere');
xlabel('X Distance (meters) in 100m increments');
ylabel('Gravitational Attraction (mGal)');

%2.3 Part A
a = 100;

gz_cyl = cylinderGz(a,z,p1,p2,x);
figure
plot(x,gz_cyl,'.-')
hold on
plot(x,Gz,'.-')

title('Gravitational Attraction of a Sphere against a Cylinder');
xlabel('X Distance (meters) in 100m increments');
ylabel('Gravitational Attraction (mGal)');



%2.3 Part B
gz2_cyl = cylinderGz(a,z,p1,p2,Z);
figure
mesh(xmesh,ymesh,gz2_cyl,FaceColor="blue",FaceAlpha="0.25")
hold on
mesh(xmesh,ymesh,Gz2,FaceColor = "red")
