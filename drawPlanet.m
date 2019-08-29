function [handle] = drawPlanet(x,y,z,radius,image)
%[handle] = drawPlanet(x,y,z,radius,image): This function creates a planet
%based on coordinates of the planets, the radius of the planet and an image
%to be mapped onto the sphere.
%   A sphere is created using the sphere command. It is shifted to the
%   desired coordinate and then scaled up to an appropriate size based on
%   the radius of the planet. Using the surface command, the image can be
%   appropraitely applied to the sphere to give a realistic apperance.
%   Input x,y,z = Coordiante of the planet.
%   Input radius = radius of the planet.
%   Input image = image of the planet read in from a jpeg file.
%   Output handle = handle to the planet.

%   Version 1: Created 04/04/17. Author: D. Gormley
%   This MATLAB function m-file can be used to draw a planet.

%=========================================================================%
%Internal Parameters
N = 50; %An N by N matrix will make up the sphere coordinates.

%=========================================================================%

%Error Checking: To ensure the correct values were inputted into function.
if (nargin ~= 5), error('Incorrect number of input arguments.'); end

%First a sphere of radius one is created centred on the origin.
[X,Y,Z] = sphere(N);

%Calculate the coordiantes for the planet, where xp, yp and zp are the
%coordiates of the planet.
xp = x + (X*radius);
yp = y + (Y*radius);
zp = z + (Z*radius);

%Since the coordinates of the sphere have been dealt with, the sphere can
%be created to look like a realistic representation of the planet.
handle = surface(xp,yp,flip(zp),image,'FaceColor','texturemap',...
            'EdgeColor','none',...
            'CDataMapping','direct');

%Error Checking: To ensure the correct values were outputted from function.
if (nargout ~= 1), error('Incorrect number of output arguments.'); end

end

