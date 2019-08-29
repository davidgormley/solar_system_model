function [ acceleration ] = acceleration(v,r)
% function to calculate the acceleration of a planetary body as a function
% of the other planets in its solar system. The following formula is used
% to calculate acceleration:

% Ci = scaled version of constant G*Mi, where the ith planet is causing
% acceleration on planet j
% ri = x,y,z coordinates of planet causing acceleration
% rj = x,y,z coordinates of planet being accelerated

% a = for all i ne j, summation((Ci*(ri-rj))/(norm(ri-rj))^3)
% where norm(ri-rj) = sqrt((xi-xj)^2+(yi-yj)^2+(zi-zj)^2)

% input v = matrix of x,y,and z coordinates (and velocities) of all
% planetary bodies
% input r = x,y, and z coordinates of the planet whose acceleration is to
% be found

% set constants needed for scaling factor
G = 6.67*(10^(-11));         % universal gravitational constant. units: (m^3/(kg*s^2))
AU = 149597870700;           % astronomical unit - distance earth is from sun. units: m
TU = 86400;                  % time unit - one earth day. units: s

% masses. units: kg
m0 = 1.988544*(10^30);              % sun
m1 = 3.302*(10^23);                 % mercury
m2 = 48.685*(10^23);                % venus
m3 = 5.97219*(10^24)+734.9*(10^20); % earth 
m4 = 6.4185*(10^23);                % mars
m5 = 1898.13*(10^24);               % jupiter
m6 = 5.68319*(10^26);               % saturn
m7 = 86.8103*(10^24);               % uranus
m8 = 102.41*(10^24);                % neptune

M = [m0 m1 m2 m3 m4 m5 m6 m7 m8]';

C = G*M*(TU^2)/(AU^3);

% if statemtents exclude trying to calculate a planet's gravitational force
% on itself -> this doesn't exist

if (norm(v(1:3)-r) == 0)                       
    s1 = [0;0;0];
else
    s1 = C(1)*((v(1:3)-r)/((norm(v(1:3)-r))^3));     % acceleration of planet due to sun
end

if (norm(v(7:9)-r) == 0)
    s2 = [0;0;0];
else
    s2 = C(2)*((v(7:9)-r)/((norm(v(7:9)-r))^3));     % acceleration of planet due to mercury
end 

if (norm(v(13:15)-r) == 0)
    s3 = [0;0;0];
else 
    s3 = C(3)*((v(13:15)-r)/((norm(v(13:15)-r))^3)); % acceleration of planet due to venus
end

if (norm(v(19:21)-r) == 0)
    s4 = [0;0;0];
else
    s4 = C(4)*((v(19:21)-r)/((norm(v(19:21)-r))^3)); % acceleration of planet due to earth
end

if (norm(v(25:27)-r) == 0)
    s5 = [0;0;0];
else
    s5 = C(5)*((v(25:27)-r)/((norm(v(25:27)-r))^3)); % acceleration of planet due to mars
end

if (norm(v(31:33)-r) == 0)
    s6 = [0;0;0];
else
    s6 = C(6)*((v(31:33)-r)/((norm(v(31:33)-r))^3)); % acceleration of planet due to jupiter
end

if (norm(v(37:39)-r) == 0)
    s7 = [0;0;0];
else
    s7 = C(7)*((v(37:39)-r)/((norm(v(37:39)-r))^3)); % acceleration of planet due to saturn
end

if (norm(v(43:45)-r) == 0)
    s8 = [0;0;0];
else 
    s8 = C(8)*((v(43:45)-r)/((norm(v(43:45)-r))^3)); % acceleration of planet due to uranus
end
 
if (norm(v(49:51)-r) == 0)
    s9 = [0;0;0];
else
    s9 = C(9)*((v(49:51)-r)/((norm(v(49:51)-r))^3)); % acceleration of planet due to neptune
end

acceleration = s1+s2+s3+s4+s5+s6+s7+s8+s9;

end

