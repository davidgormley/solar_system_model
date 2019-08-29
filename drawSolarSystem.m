function [handlePlanets] = drawSolarSystem(H,n)
%[handle] = drawSolarSystem(n): Based on the index value n, the respective
%planets and background to the solar system can be drawn for the
%coordinates associated with index n.
%   Input n = index of the matrix of coordinates.
%   Input H = matrix of all coordinates
%   Output handle = handle to the image of the solar system.

%   Version 1: Created 04/04/17. Author: D. Gormley
%   This MATLAB function m-file can be used to draw all the planets and the
%   starry background for the solar system.

%=========================================================================%

%Internal Parameters
sun = imread('sun.jpg');
mercury = imread('mercury.jpg');
venus = imread('venus.jpg');
earth = imread('earth.jpg');
mars = imread('mars.jpg');
jupiter = imread('jupiter.jpg');
saturn = imread('saturn.jpg');
uranus = imread('uranus.jpg');
neptune = imread('neptune.jpg');

% These parameters for the radius makes all planets the same size.
Scaling_factor = 149597.870700;     %Decreased AU by a fator of 10^-6

%Kept the same order in size of the planets but they are now closer in
%size.
radius_sun = (70000)/Scaling_factor;
radius_jupiter = 60000/Scaling_factor;
radius_saturn = 50000/Scaling_factor;
radius_uranus = 30000/Scaling_factor;
radius_neptune = 30000/Scaling_factor;
radius_earth = 10000/Scaling_factor;
radius_venus = 10000/Scaling_factor;
radius_mars = 5000/Scaling_factor;
radius_mercury = 2500/Scaling_factor;
%=========================================================================%

%Error Checking: To ensure the correct values were inputted into function.
if (nargin ~= 2), error('Incorrect number of input arguments.'); end

%Making all the planets
h_sun = drawPlanet(H(1,n),H(2,n),H(3,n),radius_sun,sun);
h_mer = drawPlanet(H(7,n),H(8,n),H(9,n),radius_mercury,mercury);
h_ven = drawPlanet(H(13,n),H(14,n),H(15,n),radius_venus,venus);
h_ear = drawPlanet(H(19,n),H(20,n),H(21,n),radius_earth,earth);
h_mar = drawPlanet(H(25,n),H(26,n),H(27,n),radius_mars,mars);
h_jup = drawPlanet(H(31,n),H(32,n),H(33,n),radius_jupiter,jupiter);
h_sat = drawPlanet(H(37,n),H(38,n),H(39,n),radius_saturn,saturn);
h_ura = drawPlanet(H(43,n),H(44,n),H(45,n),radius_uranus,uranus);
h_nep = drawPlanet(H(49,n),H(50,n),H(51,n),radius_neptune,neptune);

%In the case where the figure is kept open during the video making, a
%matrix of the planet handles handles is returned and deleted in figure.
handlePlanets = [h_sun;h_mer;h_ven;h_ear;h_mar;h_jup;h_sat;h_ura;h_nep];

%Error Checking: To ensure corrent number of values being outputted
if (nargout ~= 1), error('An incorrect number of elements are being returned'); end

end

