
function R1 = R1(angle)
    R1 = zeros(3,3);
    R1(1,1) = 1;
    R1(2,2) = cos(angle);
    R1(2,3) = sin(angle);
    R1(3,2) = -sin(angle);
    R1(3,3) = cos(angle);
end