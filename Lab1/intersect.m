x1 = 16.005;
y1 = -229.503;
x2 = 228.111;
y2 = -17.611;
x3 = 16.112;
y3 = -17.421;
x4 = 227.956;
y4 = -229.599;

intersection = findIntersection(x1,y1,x2,y2,x3,y3,x4,y4);
intersection


function intersectionPoint = findIntersection(x1, y1, x2, y2, x3, y3, x4, y4)
    % Calculate slopes and y-intercepts
    m1 = (y2 - y1) / (x2 - x1);
    b1 = y1 - m1 * x1;
    
    m2 = (y4 - y3) / (x4 - x3);
    b2 = y3 - m2 * x3;

    % Find the intersection point
    xIntersection = (b2 - b1) / (m1 - m2);
    yIntersection = m1 * xIntersection + b1;
    
    intersectionPoint = [xIntersection, yIntersection];
end

