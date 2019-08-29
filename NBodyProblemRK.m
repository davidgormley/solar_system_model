function planetPositions = NBodyProblemRK(noDays,noPlanets,h,initialConditions)

% NBodyProblemRK(): solve for the positions of 9 planetary bodies using
% a fourth order Runge-Kutta method, provided initial positions and
% velocities of the planetary bodies

% input noDays = number of days for which the positions of the planets
% should be predicted
% input noPlanets = number of planetary bodies that are being modelled
% input h = step size (relative to 1 day)
% input initialConditions = matrix of initial positions and velocities of 
% all bodies, taken on the same day at the same time

% output planetPositions = prediction of positions of all bodies for given
% input noDays

% Version 1: created 3/4/2017. Author: Anna McCann

% -------------------------------------------------------------------------


%% Runge-Kutta Calculations

% set aside memory for matrix that stores (X,Y,Z) coordinates for each of noDays
planetPositions = zeros(noPlanets*6,(noDays/h));
v = initialConditions;
planetPositions(:,1) = v;

for count = 2:(noDays/h)
    tv = v;
    k1 = h*(RungeKuttaFunctionF(tv));

    tv = v+0.5*k1;
    k2 = h*(RungeKuttaFunctionF(tv));
    
    tv = v+0.5*k2;
    k3 = h*(RungeKuttaFunctionF(tv));
    
    tv = v+k3;
    k4 = h*(RungeKuttaFunctionF(tv));
    
    v = v + (1/6)*(k1+(2*k2)+(2*k3)+k4);
    
    planetPositions(:,count) = [v'];
end


