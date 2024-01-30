function R2 = R2(angle)
    R2 = zeros(3,3);
    R2(1,1) = cos(angle);
    R2(3,1) = sin(angle);
    R2(1,3) = -sin(angle);
    R2(3,3) = cos(angle);
    R2(2,2) = 1;
end