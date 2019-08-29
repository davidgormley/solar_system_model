function [ F ] = RungeKuttaFunctionF(tv)

% return function F required for fourth order Runge-Kutta method for
% predicting x,y, and z coordinates for planets. Within Runge-Kutta, F
% takes the form:



% input tv = v matrix from which F is calculated
% output F = function required for Runge-Kutta

% Version 1: created 3/4/2017. Author: Anna McCann

% -------------------------------------------------------------------------

F = [tv(4:6);acceleration(tv,tv(1:3));tv(10:12);acceleration(tv,tv(7:9));tv(16:18);acceleration(tv,tv(13:15));tv(22:24);acceleration(tv,tv(19:21));tv(28:30);acceleration(tv,tv(25:27));tv(34:36);acceleration(tv,tv(31:33));tv(40:42);acceleration(tv,tv(37:39));tv(46:48);acceleration(tv,tv(43:45));tv(52:54);acceleration(tv,tv(49:51))];

end

