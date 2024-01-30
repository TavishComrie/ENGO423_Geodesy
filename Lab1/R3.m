function R3 = R3(angle)
    R3 = zeros(3,3);
    R3(1,1) = cos(angle);
    R3(1,2) = sin(angle);
    R3(2,1) = -sin(angle);
    R3(2,2) = cos(angle);
    R3(3,3) = 1;
end