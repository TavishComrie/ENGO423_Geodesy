%Function to create R1 rotation matrix about x
%Input the angle
%Outputs 3x3 rotation matrix 
function R1 = R1(angle)
    R1 = zeros(3,3);
    R1(1,1) = 1;
    R1(2,2) = cosd(angle);
    R1(2,3) = sind(angle);
    R1(3,2) = -sind(angle);
    R1(3,3) = cosd(angle);
end