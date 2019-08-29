function [handle] = createAnimation(H,N)
%[handle] = createAnimation(H): Creates Solar System animation
%   Loops through all the coordinates to create video.
%   Input H = matrix of all the coordinates
%   Input N = number of coordinates for each planet is equal to the number
%   of frames in the video.
%   Output handle = handle to figure

%   Version 1: Created 04/04/17. Author: D. Gormley
%   This MATLAB function m-file can be used to create the animation for the
%   solar system over a period of three years

%=========================================================================%
%Input arguments
FrameNumber = N;

%=========================================================================%

%Error Checking: To ensure the correct values were inputted into function.
if (nargin ~= 2), error('Incorrect number of input arguments.'); end

% Use VideoWriter to create a suitable video object ready to receive data.
VideoObject = VideoWriter('SolarSystemRotateFinal.avi');
open(VideoObject);

%Set up an initial value for camzoom
zoom = 2.5;

%Loop that draws out the figure of each frame to create video    
for count = 1:FrameNumber   
    %Setting up the axis and then removing it
    handlefig = figure('Position',[100 100 850 600]);
    axis([-30 30 -30 30 -30 30]);
    axis off;
    
    %Starting at the specified viewpoint
    az = -37.5;
    el = 0;
    view(az,el);
    
    %Setting up light sources to surround the sun
    light('Position',[0.2 0 0.3]);
    light('Position',[-0.2 0 0.3]);
    light('Position',[0.2 0 -0.3]);
    light('Position',[-0.2 0 -0.3]);
    light('Position',[0 0.2 0.3]);
    light('Position',[0 -0.2 0.3]);
    light('Position',[0 0.2 -0.3]);
    light('Position',[0 -0.2 0.3]);
    
    %As the zoom factor increases, the figure becomes closer and closer to
    %the sun. At first the animation begins from further back.
    camzoom(zoom);
    
    %Orbiting from looking from the side to looking from above by the end
    %of the video.
    camorbit(120,(0.2*count),'data',[0 0 1]);

    %Creating the starry background and setting it behind all of the
    %planets
    stars = imread('stars.jpg');
    Background = axes('units','normalized','position',[0 0 1 1]);
    uistack(Background,'bottom');
    imagesc(stars);
    set(Background,'handlevisibility','off','visible','off');
   
    %Function call to draw all the frames and gets the output of a matrix
    %of all the links to be deleted.
    handlePlanets = drawSolarSystem(H,count);

    %Get the frame and add it into the video
    current_frame = getframe(handlefig);
    writeVideo(VideoObject,current_frame);
    
    %In this implementation the figure is closed after all the planets of
    %the frame have been added to the video.
    close(handlefig)
    
    %Update camera parameters, this method allowed you to remain zoomed out
    %for longer initially before zooming in.
    zoom = 2 + 1.012^(count - 45);
    
end

end