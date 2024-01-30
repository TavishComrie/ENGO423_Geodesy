%Function to create R3 rotation matrix about z
%Input the angle
%Outputs 3x3 rotation matrix 
function R3 = R3(angle)
    R3 = zeros(3,3);
    R3(1,1) = cosd(angle);
    R3(1,2) = sind(angle);
    R3(2,1) = -sind(angle);
    R3(2,2) = cosd(angle);
    R3(3,3) = 1;
end