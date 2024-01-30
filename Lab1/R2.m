%Function to create R2 rotation matrix about y
%Input the angle
%Outputs 3x3 rotation matrix 
function R2 = R2(angle)
    R2 = zeros(3,3);
    R2(1,1) = cosd(angle);
    R2(3,1) = sind(angle);
    R2(1,3) = -sind(angle);
    R2(3,3) = cosd(angle);
    R2(2,2) = 1;
end