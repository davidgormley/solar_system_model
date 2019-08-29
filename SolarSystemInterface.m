%=========================================================================%
%Project: Simulation of the Solar System.
%Author: David Gormley
%Date: 13/03/17
%Version 1 (13/03/17)
%=========================================================================%

%Description: This interface will allow the user to simply run this
%m-file and the other functions will be called. The goal is that running
%this interface will create an animation. Note: You must have the correct
%matrix from the the simualtion stage which was passed on by another team
%member.

%=========================================================================%

% close all;
% clear all;

%=========================================================================%

%Need to find a way of returning the size of the matrix
N = 1095;   %Number of days that the video is representing
h = 3;      %The time step taken is three days

%Number of columns of data in matrix
N = N/h;


%% set up initial conditions - Code taken from team member
% positions. units: AU
r0 = [0.00312333519196335   0.00450978142746554 -0.000150545080032502];       % sun
r1 = [-0.0774587029571558  0.30591011145912  0.0318703246329729];             % mercury
r2 = [-0.707838991165201 -0.10656607953956  0.0393521972032794];              % venus
r3 = [-0.986938928322326 -0.121740896299376 -0.000140319108910786];           % earth
r4 = [0.636268552595217   1.37302898377351   0.0129888766436195];             % mars
r5 = [-5.20797236646778  -1.60759686413266   0.12314873418682];               % jupiter
r6 = [-1.41813935355807  -9.94860783978301   0.229370008391219];              % saturn
r7 = [18.2048232803602    8.1243775604449  -0.205672472015468];               % uranus
r8 = [28.4238540340032   -9.432039914991  -0.46082168262752];                 % neptune

% velocities. units: AU/TU = AU/day
vr0 = [-3.51496209719664E-06  6.56990869149143E-06  7.7230633518229E-08];
vr1 = [-0.0328286658750067 -0.00622674875110938  0.00250216903303796];
vr2 = [0.00299101147415254  -0.020067269366658 -0.000448034543170779];
vr3 = [0.00189283272625844  -0.0171240456109283  7.52897901967832E-07];
vr4 = [-0.0121733086812044  0.00707460829744573  0.000446863905282549];
vr5 = [0.00213774883261669  -0.00685151974882432 -0.0000193074484086508];
vr6 = [0.00521769280913846  -0.000805516549849303 -0.000193577211828262];
vr7 = [-0.00163157380499732  0.00340830768769551  0.0000338109470662919];
vr8 = [0.00096745375624573   0.00299818089685532    -0.0000836502670369106];

%% set up v matrix, containing initial positions and velocities of all planetary bodies
v = [r0 vr0 r1 vr1 r2 vr2 r3 vr3 r4 vr4 r5 vr5 r6 vr6 r7 vr7 r8 vr8]';

noDays = 1095;
noPlanets = 9;
stepSize = 3;    % units: days

planetPositions = NBodyProblemRK(noDays,noPlanets,stepSize,v);

%Running this function will begin the process of creating an animation.
createAnimation(planetPositions,N);
