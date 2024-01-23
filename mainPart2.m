close all
R = 100;
z = 275;
p2 = 4260;
p1 = 2760;
x = -5000:100:5000;


%2.1 Part A
Gz = gz(p1,p2,R,z,x);

h1 = plot(x,Gz,".-")
legend([h1], '4260kg/m^{3} 275m Deep Sphere', 'Location', 'Best');
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

h1 = mesh(xmesh,ymesh,Gz2)
colorbar;
title("2D Gravitational Attraction of a Sphere 275m Deep")
xlabel('X Distance (meters) in 100m Increments')
ylabel('Y Distance (meters) in 100m Increments')
zlabel('Gravitational Attraction (mGal)')
legend([h1], '4260kg/m^{3} 275m Deep Sphere', 'Location', 'Best');

grid on

%2.2 Part A
figure
z1 = 350;

Gz3 = gz(p1,p2,R,z1,x);

h1 = plot(x,Gz,'.-')
hold on
h2 = plot(x,Gz3,'.-')
legend([h1,h2],'4260kg/m^{3} 275m Deep Sphere', '4260kg/m^{3} 350m Deep Sphere', 'Location', 'Best');

figure
plot(x,Gz3,'.-')
title('Gravitational Attraction of Spheres at Varying Depths');
xlabel('X Distance (meters) in 100m increments');
ylabel('Gravitational Attraction (mGal)');

%2.2 Part B

figure
p3 = 5760;

Gz4 = gz(p1,p3,R,z1,x);

h1 = plot(x,Gz,'.-')
hold on
h2 = plot(x,Gz4,'.-')
legend([h1,h2],'4260kg/m^{3} 275m Deep Sphere', '5760/m^{3} 350m Deep Sphere', 'Location', 'Best');


plot(x,Gz4,'.-')
title('Gravitational Attraction of Spheres at Varying Densities');
xlabel('X Distance (meters) in 100m increments');
ylabel('Gravitational Attraction (mGal)');

%2.2 Part C
Gzx = gzx(p1,p2,R,z,x);
Gzx1 = gzx(p1,p3,R,z1,x);

figure
h1 = plot(x,Gzx,'.-')
hold on
h2 = plot(x,Gzx1,'.-')
legend([h1,h2],'4260kg/m^{3} 275m Deep Sphere', '5760kg/m^{3} 350m Deep Sphere', 'Location', 'Best');

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
h1 = mesh(xmesh,ymesh,gz2_cyl,FaceColor="blue",FaceAlpha="0.25")
hold on
h2 = mesh(xmesh,ymesh,Gz2,FaceColor = "red")
title("2D Gravitational Attraction of a Cylinder vs a Sphere 275m Deep")
xlabel('X Distance (meters) in 100m Increments')
ylabel('Y Distance (meters) in 100m Increments')
zlabel('Gravitational Attraction (mGal)')
legend([h1,h2], '4260kg/m^{3} 275m Deep Cylinder','4260kg/m^{3} 275m Deep Sphere', 'Location', 'Best');