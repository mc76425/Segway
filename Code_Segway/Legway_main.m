clear all; close all; clc

%% Legway parameters
m = 1;
M = 1;
l = 1;
g = 9.81;

X0 = [pi;0;0;0];
F = 0;
T = 0;
%% Linear state-space representation X = [theta theta_dot x x_dot], U = [F T]
% Two possibility:
%   Use regular integrator or wrap integrator with theta between (0; 2pi)
%   => The system will be unstable for theta0 around pi
%   Use wrap integrator with theta between (-pi; pi)
%   => The position x will be more stable, but the unstability is still
%   present.

A = [0              1   0   0;
    (M+m)*g/(M*l)   0   0   0;
    0               0   0   1;
    m*g/M           0   0   0];

B = [0  0;
    1/(M*l) (M+m)/(M*m*l^2);
    0   0;
    1/M         1/(M*l)];

%% Pole placement for T = 0

B_T0 = [0;
    1/(M*l);
    0;
    m*g/M];

des_poles = [-1;-1;-1;-1];
K = acker(A,B_T0, des_poles);

%% Desired position x
% We can use the same linear model as before. The issue will about the
% integrator. How to represent the angular position ? In our case we use
% the wrap integrator with theta between -2pi and 2pi.

X_des = [0;0;10;0];

%% Desired speed x_dot
% Does not work, the pendulum will go to (theta=0, thetadot=0, x=something,
% xdot=0)
X_speed = [0;0;0;1];
des_poles2 = [-1;-0.5;-2;-3];
K_speed = place(A,B_T0, des_poles2);
